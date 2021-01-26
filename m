Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4FC303BE0
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 12:42:36 +0100 (CET)
Received: from localhost ([::1]:40792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Mjz-00015G-Pf
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 06:42:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4MYH-0008IV-NQ
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:30:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4MY8-0004Ht-06
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:30:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611660618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zf8nZhErWee0SNJ4wh89a/VR1U83qnhK5DeFYk6Ywl0=;
 b=Dk7nlsQUnMI40CuAZ9EfKFq/wa0oFqr/42xDMooK2Y2ISWpP7Pq3XUhVexNewvySj9UX3g
 waGzBRDpHDaDZgUpMKOxnXT3r5wAnh9azAdKQhl8sWTWSTonthJyPInkKLJ4cJdsDsSchJ
 UGTKS03uqYDLOXEryjvh31lup8KyZcg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-bss-My5XO4u-bT6XKCFGlQ-1; Tue, 26 Jan 2021 06:30:17 -0500
X-MC-Unique: bss-My5XO4u-bT6XKCFGlQ-1
Received: by mail-ed1-f72.google.com with SMTP id f4so9227590eds.5
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 03:30:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zf8nZhErWee0SNJ4wh89a/VR1U83qnhK5DeFYk6Ywl0=;
 b=VxyQOlcEcNKv+V6Xcey3QI9ku4h7BWJhdBpbfQObmemVTVqwTzUqnISyMWNe+bqA8W
 ATYePjHXziC1B1uJjlTn9cx9G3NPkZVJd2P+FQ75jZYDVtpLRKu1J53QbXMKhYDvNAsu
 y7z9nnzO5ssBuH7aKHk5ezKFilI5giUx2+7cKfTA0QQ6gbO+WCV+t/Qss36Mg9KI3lYo
 CR6Vyke414F0jZ7B9dan4PGafz6hGcOtuXC1pOZnAXLSH4+EjKKj6zT1lBNmid/LqAkB
 +y+GUoVkx6nC1ZCefWKV0OetRNntkMEnys8HjGISrupxZXWTbxrbu3N46GXNGui4aUOE
 uznw==
X-Gm-Message-State: AOAM533jINedNFbaFD7kMihEDGKlKVCPWDXQz8QfKJuZFXS6P+8pYTXH
 NYqV1beWAXIrHZeIGFfQI/p0sYThvh7xwjkCiSzxtIXrZXNL7yghk82yd5aCsRWqIMLmc0mMLoe
 CPGKlrQYWril7A1o=
X-Received: by 2002:a17:906:2407:: with SMTP id
 z7mr3186754eja.219.1611660615096; 
 Tue, 26 Jan 2021 03:30:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3cNYObHz2ueBWegreDOfHfAM3Zp9//+GCusmQoXNOB8MgiytnJfnQSCRKiubCN2WJwfkDiQ==
X-Received: by 2002:a17:906:2407:: with SMTP id
 z7mr3186739eja.219.1611660614907; 
 Tue, 26 Jan 2021 03:30:14 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x25sm12106344edv.65.2021.01.26.03.30.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 03:30:14 -0800 (PST)
Subject: Re: [PATCH] iotests/118: Drop 'change' test
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210126104833.57026-1-mreitz@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <427f2bc6-1eee-fb76-2053-d3dcd0bbb170@redhat.com>
Date: Tue, 26 Jan 2021 12:30:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126104833.57026-1-mreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/01/21 11:48, Max Reitz wrote:
> Commit 0afec75734331 removed the 'change' QMP command, so we can no
> longer test it in 118.
> 
> Fixes: 0afec75734331a0b52fa3aa4235220eda8c7846f
>         ('qmp: remove deprecated "change" command')
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   tests/qemu-iotests/118     | 17 -----------------
>   tests/qemu-iotests/118.out |  4 ++--
>   2 files changed, 2 insertions(+), 19 deletions(-)

How come this didn't break GitLab CI?...

Paolo

> diff --git a/tests/qemu-iotests/118 b/tests/qemu-iotests/118
> index 1a2e219057..88e8354e21 100755
> --- a/tests/qemu-iotests/118
> +++ b/tests/qemu-iotests/118
> @@ -74,23 +74,6 @@ class ChangeBaseClass(iotests.QMPTestCase):
>   
>   class GeneralChangeTestsBaseClass(ChangeBaseClass):
>   
> -    def test_change(self):
> -        # 'change' requires a drive name, so skip the test for blockdev
> -        if not self.use_drive:
> -            return
> -
> -        result = self.vm.qmp('change', device='drive0', target=new_img,
> -                                       arg=iotests.imgfmt)
> -        self.assert_qmp(result, 'return', {})
> -
> -        self.wait_for_open()
> -        self.wait_for_close()
> -
> -        result = self.vm.qmp('query-block')
> -        if self.has_real_tray:
> -            self.assert_qmp(result, 'return[0]/tray_open', False)
> -        self.assert_qmp(result, 'return[0]/inserted/image/filename', new_img)
> -
>       def test_blockdev_change_medium(self):
>           result = self.vm.qmp('blockdev-change-medium',
>                                id=self.device_name, filename=new_img,
> diff --git a/tests/qemu-iotests/118.out b/tests/qemu-iotests/118.out
> index bf5bfd5aca..0a70391105 100644
> --- a/tests/qemu-iotests/118.out
> +++ b/tests/qemu-iotests/118.out
> @@ -1,5 +1,5 @@
> -.......................................................................................................................................................................
> +...........................................................................................................................................................
>   ----------------------------------------------------------------------
> -Ran 167 tests
> +Ran 155 tests
>   
>   OK
> 


