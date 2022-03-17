Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEFA4DCA2D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 16:41:05 +0100 (CET)
Received: from localhost ([::1]:36304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUsFM-0006Nj-3d
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 11:41:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUs95-000219-6t
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:34:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUs93-0003uY-Kj
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:34:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647531273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c6X25MWF2N3Jn3oSHM41VqigdifP+5ADU3JNgDyF24c=;
 b=X4HmAtphq3Fdifce3qtofRQEd8kmgHJUxG6652sbEcMCiqds8X19abiFjRVzJUYG7WcC85
 PTpigVzeFkW9P9pmywwZGdkjDpeSU8R6OVX0vJtgZQdppZNbDj4Ykwla8v7BOc3VihBEpN
 8/nijAwrniByjrXjRE8uysKBDL8yYRY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-xn_27TrdNlOinhtmH9Ijdw-1; Thu, 17 Mar 2022 11:34:31 -0400
X-MC-Unique: xn_27TrdNlOinhtmH9Ijdw-1
Received: by mail-ej1-f72.google.com with SMTP id
 13-20020a170906328d00b006982d0888a4so3096871ejw.9
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 08:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c6X25MWF2N3Jn3oSHM41VqigdifP+5ADU3JNgDyF24c=;
 b=OKnVq3jhInCUC6tZ3dkdOPW1vvxkPK7gR9U9y/U1WrWba87XDjWqF13hY2m4qtjPUn
 fk5Okr6eyoWYy10r8WaAVKRcBlgf+3Hu3hX6glmQ6lx31oMc3AxAUuxWH0kxoWqRMuw1
 jg1PTzxiQcWpUI/n13DAO7/BE95cEpoL0uVdBd2mokgTmQnskLoFh9DjLtzAqKiBWdb/
 LEG9OOo4nEIyjGXbFsfzAEKRiHV25GFq4vI5sMDO40GDBM4eN01deG4VzYNrRmgm24Uf
 CkWdjlApQgGL5Wx3jGw21mryjVjsHjeoDw+JbPVOtZzJVxCMzN8FfB0gkdIL+bnyFrv4
 lNoQ==
X-Gm-Message-State: AOAM53129lETrny5G2VybPqSh48Uluhct3s2g76c8TKAAYDLPDn+vGX2
 UIfBaX0+BQDfANHUfnbrt8M56aMZ/oKXNRkLsNt99WuxiQXXo6C/JM5OblipnZoxln2HT3SvY6f
 QDLPywEQmyNroTEo=
X-Received: by 2002:a05:6402:2682:b0:416:cee9:53db with SMTP id
 w2-20020a056402268200b00416cee953dbmr5186839edd.194.1647531270647; 
 Thu, 17 Mar 2022 08:34:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0avxISgAkhigjvlSOb/oKJ6RxEyE0J/xEnjuvmz1jXO5TC7yLpZLuMUJbTmt4G3klqzftIA==
X-Received: by 2002:a05:6402:2682:b0:416:cee9:53db with SMTP id
 w2-20020a056402268200b00416cee953dbmr5186819edd.194.1647531270457; 
 Thu, 17 Mar 2022 08:34:30 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 bx5-20020a0564020b4500b00418fca53406sm910726edb.27.2022.03.17.08.34.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 08:34:30 -0700 (PDT)
Message-ID: <c27b6565-122b-1b62-17be-d4b1ef5ca33b@redhat.com>
Date: Thu, 17 Mar 2022 16:34:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 13/14] iotests: make qemu_img_log() check log level
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220309035407.1848654-1-jsnow@redhat.com>
 <20220309035407.1848654-14-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220309035407.1848654-14-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.03.22 04:54, John Snow wrote:
> Improve qemu_img_log() to actually check if logging is turned on. If it
> isn't, revert to the behavior of qemu_img(). This is done so that there
> really is no way to avoid scrutinizing qemu-ing subprocess calls by
> accident.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/iotests.py | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)

Looks OK to me, so

Reviewed-by: Hanna Reitz <hreitz@redhat.com>

But I’d really just prefer `qemu_img_log()` to check the exit status all 
the time.


