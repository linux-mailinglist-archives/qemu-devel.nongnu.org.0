Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11E82F9C3A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 11:17:46 +0100 (CET)
Received: from localhost ([::1]:36272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1RbV-0004cW-R2
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 05:17:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1RAG-0002Nn-IO
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:49:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1RAC-00026c-6d
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:49:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610963371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pGLt3sGOa1DX63ebI5z69+0IiO9HEDs1oee+fF3mB90=;
 b=NaXBiqmKtn63aDGmJXbDp7XsMVgH1phqgi1PBnErhStSxJ2nk0BU90GjEXIdliowPIUhS3
 2x/oWHuCqk+3sFVP045hr27iV3xQj1FqaUKH7AeDL7epSswY9FyAr0X3d9rqVWi6tc8zqR
 IegGughwa4zU6FXBQYCSk9ZjDIf4DTo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-coLNlVm9MxSytQiSoAHeeg-1; Mon, 18 Jan 2021 04:49:30 -0500
X-MC-Unique: coLNlVm9MxSytQiSoAHeeg-1
Received: by mail-wr1-f69.google.com with SMTP id m20so8032757wrh.2
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 01:49:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pGLt3sGOa1DX63ebI5z69+0IiO9HEDs1oee+fF3mB90=;
 b=lo7Y9tF4600ZWCBHtqZ0GFSxrph3QuY5p+MGKysx8G67InwLk4tU4M2HsqdhMnT8jE
 bwgoDxbh4MOu+sRvRSnJ8TfoYvReoxalwpS5+Uv2oJI6E7WcVuMolEdZl5camLluFIGF
 /upd+u+JGImsnMFw0GzdceHj/6zGCv+Hnna2yYwH+gv5iP7JtUJEOm5/hwOafRp7pPEo
 g3UcuyfWx4rU578qQRICqR1NRJwFs7mvlmqiqRD44YWhPg5wZ95UafQ/2UaWIL/I7Kzx
 FvyEh6Onu0XUtRslTs1IykSd790or/7fBMY2cuW4z4IRaKyxUlbMN8DWHSuL/6Zs6qmC
 B9ig==
X-Gm-Message-State: AOAM5329c5oqFhltoGbr/PYQK5E5M2xNsEdax6C0kHJOU0kWiO/+CR7A
 YC6YDpK6/A5lECObuUaqghoIiErjhjjV4vvuhtl9GkyNAZwwKQ9aTaaVNlUaDURmqTp7mNzFmB/
 2+ENkaCDczMO5r5I=
X-Received: by 2002:a1c:2c82:: with SMTP id s124mr19516801wms.81.1610963368679; 
 Mon, 18 Jan 2021 01:49:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQJ4rhWD0vYsf8kCpb4L65W2eUXLR5W0BysQ65BAZq4fitqwZjMOEnn4oD/bZqv+cQGso2lg==
X-Received: by 2002:a1c:2c82:: with SMTP id s124mr19516786wms.81.1610963368471; 
 Mon, 18 Jan 2021 01:49:28 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g192sm16337429wmg.18.2021.01.18.01.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 01:49:27 -0800 (PST)
Subject: Re: [PATCH v2] ide: atapi: check logical block address and read size
 (CVE-2020-29443)
To: P J P <ppandit@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210118063229.442350-1-ppandit@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d6f38367-136a-7a34-4b9e-c00c753b298c@redhat.com>
Date: Mon, 18 Jan 2021 10:49:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210118063229.442350-1-ppandit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Prasad J Pandit <pjp@fedoraproject.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Wenxiang Qian <leonwxqian@gmail.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/21 7:32 AM, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
> 
> While processing ATAPI cmd_read/cmd_read_cd commands,
> Logical Block Address (LBA) maybe invalid OR closer to the last block,
> leading to an OOB access issues. Add range check to avoid it.
> 
> Fixes: CVE-2020-29443
> Reported-by: Wenxiang Qian <leonwxqian@gmail.com>
> Fix-suggested-by: Paolo Bonzini <pbonzini@redhat.com>

"Suggested-by"

> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  hw/ide/atapi.c | 30 ++++++++++++++++++++++++------
>  1 file changed, 24 insertions(+), 6 deletions(-)


