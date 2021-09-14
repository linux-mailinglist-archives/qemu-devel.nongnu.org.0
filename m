Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1426B40AACF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 11:26:22 +0200 (CEST)
Received: from localhost ([::1]:41406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ4ho-0004B6-TX
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 05:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQ4fu-0002jp-SK
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 05:24:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQ4fj-0000rI-TV
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 05:24:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631611450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LPIuy3F8o2+eSxuYlqAIsCsLKqfAz+ZJN58BOZS8sK8=;
 b=HkC4yr6m68YSoek1FWNqmsiU06yz4PnoeWAyz6vVgXxcHV8BurLxxVY6r8U4xLN3GAKBs4
 UBqT8MP6pLXsOCsQzxFnkPwBYsbVHIHSFpBn9+nxWCn+sKgvYXLAK5CrfmgL14C6nVJzol
 Ypk53qzoYyebu7E634y/ChfJ5gq/1/c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-L_movuyhO4eCYHaUyYD_iw-1; Tue, 14 Sep 2021 05:24:07 -0400
X-MC-Unique: L_movuyhO4eCYHaUyYD_iw-1
Received: by mail-wr1-f72.google.com with SMTP id
 x2-20020a5d54c2000000b0015dfd2b4e34so2022326wrv.6
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 02:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=LPIuy3F8o2+eSxuYlqAIsCsLKqfAz+ZJN58BOZS8sK8=;
 b=bZiV1GCEAuGUNqkrjXUWVoXg6qSW1K8tc7RKTVejzacHPWwyS7w3PHuK+i8ou2xYLv
 Ns7T8Ml6DD3TIXjehwz7+P5WxKvqRPxtlnKx9Wkx7rPmmwKqASUdqx6KcZtvUEUT0YeS
 f0c52fOtIyDayrx06a+KI2QSjshkqEhhDqOjL1V45fWCJYCh4E8WIVBFbOkIMcfsBYyM
 /u6fp830k8349HivujbDRXzp3y8d25KhlGMrP60dDW+OgxrE+m5cPPvhm3ZgoAvjRn2Z
 ++EPKY0YL74vkCWmmSxugTTQbfRRXbRJXU4mZWcYCmRqtUVZ+yRodv1H7vSfQnyb03r+
 VgNQ==
X-Gm-Message-State: AOAM531dnVvWxdkkKX+FRvPe6YJ1+OWwcI3r5GTxw7HVrXzUMRErNOoV
 pYM+/B85xhF0qxvozn5nXFdhiaPJGOcaDysaPM2RE+Hy9xMK71jZvWAzl6STRyYgktxFmtFzrbZ
 sL2fE+Dqy4S4ELtg=
X-Received: by 2002:a05:600c:4ed1:: with SMTP id
 g17mr1003084wmq.193.1631611446600; 
 Tue, 14 Sep 2021 02:24:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIWxXtDU4pW8lPQHZ0WcwhxUfZtSj5A7H1qovSbnoCHN4anP1FCqnZGH53seVGvVJx9gcgkQ==
X-Received: by 2002:a05:600c:4ed1:: with SMTP id
 g17mr1003063wmq.193.1631611446301; 
 Tue, 14 Sep 2021 02:24:06 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id f3sm549736wmj.28.2021.09.14.02.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 02:24:05 -0700 (PDT)
Subject: Re: [PATCH] qemu-img: Allow target be aligned to sector size
To: qemu-block@nongnu.org
References: <20210819101200.64235-1-hreitz@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <2f38ecae-e940-343f-88e9-5f36419bda27@redhat.com>
Date: Tue, 14 Sep 2021 11:24:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819101200.64235-1-hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On 19.08.21 12:12, Hanna Reitz wrote:
> We cannot write to images opened with O_DIRECT unless we allow them to
> be resized so they are aligned to the sector size: Since 9c60a5d1978,
> bdrv_node_refresh_perm() ensures that for nodes whose length is not
> aligned to the request alignment and where someone has taken a WRITE
> permission, the RESIZE permission is taken, too).
>
> Let qemu-img convert pass the BDRV_O_RESIZE flag (which causes
> blk_new_open() to take the RESIZE permission) when using cache=none for
> the target, so that when writing to it, it can be aligned to the target
> sector size.
>
> Without this patch, an error is returned:
>
> $ qemu-img convert -f raw -O raw -t none foo.img /mnt/tmp/foo.img
> qemu-img: Could not open '/mnt/tmp/foo.img': Cannot get 'write'
> permission without 'resize': Image size is not a multiple of request
> alignment
>
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1994266
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
> As I have written in the BZ linked above, I am not sure what behavior we
> want.  It can be argued that the current behavior is perfectly OK
> because we want the target to have the same size as the source, so if
> this cannot be done, we should just print the above error (which I think
> explains the problem well enough that users can figure out they need to
> resize the source image).
>
> OTOH, it is difficult for me to imagine a case where the user would
> prefer the above error to just having qemu-img align the target image's
> length.
> ---
>   qemu-img.c | 8 ++++++++
>   1 file changed, 8 insertions(+)

Thanks for the review, applied to my block branch:

https://git.xanclic.moe/XanClic/qemu/commits/branch/block

Hanna


