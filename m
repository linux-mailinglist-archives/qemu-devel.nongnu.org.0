Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5E1485112
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 11:21:55 +0100 (CET)
Received: from localhost ([::1]:43714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n53QY-0004Aq-On
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 05:21:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n53Jr-00075f-9g
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:15:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n53Jd-0004Na-Cx
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:14:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641377681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g8cxZLqsgOsG5cpt/NqS/pb3nncgQ/CIFJQhyArEQmI=;
 b=I5pYiiAyo3i233dWdyNJ8ofCiXn9nK1hmNhI9ZpXM95WR7E4fwxLS6Gf4kuj6UMmjT1LJ3
 jVpMGpxUD5TCos0TImUUp81IfQ6QTkg1qESDThnwdIIKsHI46u6qtuyLH3zCz/VjwOFGk/
 9+oVwp8wbMwJqJMlNi9K9ghcUuLMK1A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-Q2tcu24cPUiCSEBB4i0_gQ-1; Wed, 05 Jan 2022 05:14:40 -0500
X-MC-Unique: Q2tcu24cPUiCSEBB4i0_gQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 e21-20020adf9bd5000000b001a472da8091so135165wrc.17
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 02:14:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g8cxZLqsgOsG5cpt/NqS/pb3nncgQ/CIFJQhyArEQmI=;
 b=G5XBG1GM1WSOc8ECN80dcY4HGhXBRfF88tKQATQOampSCnGGULaRsPwFFPLwlocTo6
 CKgo3GqI5wDLYwrbvmh5/BGznuCU6DAeFdnpgzCWCbwcqE1eN7J1rpSZYgLEnRQjX277
 6YYyM+lRFabqHpwgMk3YOLSS/d0BX0PNBhmtJoCRlFrcUj4FuyqqGWQ/1KqBUI2fHvwC
 rK1yuX1Dyo6UShFVcUvue45w/a0YSrihRqtNSA1xJWz7LmTHM3Fe85/1UTTxzL6J+jr5
 T5nxjlxqykMd7curoxXno/10+pIJM50AJjezn53S561ip6WXMZTo1diAw1ntqnCaw5Ay
 KHYw==
X-Gm-Message-State: AOAM531COnDFCf6VCoZX16uXwtd9FoRvLG80rli/Bgmt/MKbxeBw7O8I
 qn1AOQxQAU9RdiWMonUPdSFtVaBm/W5Jqdj0l9cYtVyVF7a8AVUeQqPZmemBkE7LAQMuyNm0fF9
 ZQuSruZFibRDFUL0=
X-Received: by 2002:adf:ef46:: with SMTP id c6mr47617105wrp.555.1641377679892; 
 Wed, 05 Jan 2022 02:14:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJVVXFaA+zJtaJUlsnNI8saBsA/BDRhibnHCsAzGmvFhwjvLF8IcVyVCZcpgtzRCnDdLnnuw==
X-Received: by 2002:adf:ef46:: with SMTP id c6mr47617093wrp.555.1641377679726; 
 Wed, 05 Jan 2022 02:14:39 -0800 (PST)
Received: from [10.33.192.229] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id b1sm45780534wrd.92.2022.01.05.02.14.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 02:14:39 -0800 (PST)
Message-ID: <ef74a520-313c-2705-3a87-aa5697f05f18@redhat.com>
Date: Wed, 5 Jan 2022 11:14:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] gitlab-ci: Enable docs in the centos job
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220104091240.160867-1-thuth@redhat.com>
 <87y23ujz4b.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87y23ujz4b.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.057, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/01/2022 10.44, Alex Bennée wrote:
> 
> Thomas Huth <thuth@redhat.com> writes:
> 
>> We just ran into a problem that the docs don't build on RHEL8 / CentOS 8
>> anymore. Seems like these distros are using one of the oldest Sphinx
>> versions that we still have to support. Thus enable the docs build in
>> the CI on CentOS so that such bugs don't slip in so easily again.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> Queued to testing/next, thanks.

Note that you need Marc-André's fix first, too. But I'm also planning a pull 
request with a bunch of misc other patches soon, so I can also stick these 
two patches in there, too.

  Thomas


