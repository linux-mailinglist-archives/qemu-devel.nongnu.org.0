Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7659A310DE1
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:29:49 +0100 (CET)
Received: from localhost ([::1]:59618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l83zQ-0003pM-Hk
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:29:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l83wN-0001B8-08
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:26:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l83wL-0006PU-7p
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:26:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612542395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LUkUHjdeOXrlmsnKpmuDL86ydprOXWod7aFQCRNCbJY=;
 b=QRo825GD9YHhjAUw4k7qxcWuuXqAGapm5GgL7yEmDS/67FpBE/hgOPHh+KVtY+eaKZxn+Y
 XVwBdwTrGupCcXXc1BhpFKRKqCVOmD5iDZO0SrjdXwxP/sXTUBucEENGqnzdWqoRYLklnY
 K+lZPaD1DB7MY5sVSYWdxqb5l9zlbig=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-5t5EGwYDOWytDcNzLhvOPw-1; Fri, 05 Feb 2021 11:26:33 -0500
X-MC-Unique: 5t5EGwYDOWytDcNzLhvOPw-1
Received: by mail-ej1-f72.google.com with SMTP id yh28so7013398ejb.11
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 08:26:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LUkUHjdeOXrlmsnKpmuDL86ydprOXWod7aFQCRNCbJY=;
 b=A+aGdUJ3s9XNd4gm0YD/FFT1T+Z+P0b+l3AEw3k0VrF8e1HpYQQGzQv2aD6sedKWyM
 NRC2rq33CJgs//wX/MhKiw7IuCPRXmiwAwKC/hG7rdLSp8G6boN08E1Scgaojzs7TAaz
 5YGV2tRch8lzONoUdFUxBvAquamW7/cDBOMLNpS6jqYvNWDoPdSDHdwvBCjjU/lBbawm
 +CV1mllesiT6LJDjhDoSsHBx5mFMntO38vIvwhQH81aP8hm8hZkomjtm+8gG2Y+w+2v7
 /AX1PI/pgrQM+1zKugR9G1xWiqag5oVD8oKXZddbS10AyHHC76zg7jf4cFzk8b21PrxS
 Ef5Q==
X-Gm-Message-State: AOAM530RpzGVYiQToc3ilnuBN4Bc4Vk6AOBcDz9aB9rfmyyOEFrbOVd8
 mlsPthzv59Ec8XbJma1vpdo02dRlhTG9ONO/BkUIO+LurJC6Yq8h/wO/ZYYZfD4n7M26c9Q/fN7
 Sa+2uizwF0TJG2jE=
X-Received: by 2002:a17:906:5846:: with SMTP id
 h6mr4694431ejs.521.1612542392395; 
 Fri, 05 Feb 2021 08:26:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbzzH5OLds8gNXprlaNLdmYtRr0J/0n0YGmO8JiAIz4V4qOWmuXrGy6FRaVPGRiNTfQemMzw==
X-Received: by 2002:a17:906:5846:: with SMTP id
 h6mr4694425ejs.521.1612542392285; 
 Fri, 05 Feb 2021 08:26:32 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k22sm4381204edv.33.2021.02.05.08.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 08:26:31 -0800 (PST)
Subject: Re: [PATCH 19/33] migration: push Error **errp into
 check_section_footer()
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210204171907.901471-1-berrange@redhat.com>
 <20210204171907.901471-20-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <23c3baf6-7cdf-8134-5ffd-c110f59172f8@redhat.com>
Date: Fri, 5 Feb 2021 17:26:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210204171907.901471-20-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 6:18 PM, Daniel P. Berrangé wrote:
> This is an incremental step in converting vmstate loading code to report
> via Error objects instead of printing directly to the console/monitor.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  migration/savevm.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


