Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A596FEBE5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 08:48:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px04a-0004qo-Jk; Thu, 11 May 2023 02:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1px04M-0004m2-W9
 for qemu-devel@nongnu.org; Thu, 11 May 2023 02:46:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1px04K-0003wy-LK
 for qemu-devel@nongnu.org; Thu, 11 May 2023 02:46:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683787583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sW+z+jkbQZIZpHKYRiq845AkViqpdLMGu0OSZmujFVE=;
 b=hR9isNkEmqInuFPw9bhUuGS/Fgcv6z06kINTgyiIxhcqNrW+UerAy8j5qHxBCsyfepsJhZ
 5XOVui+KWBSQvJWgVauPW5edWfKn2Zxh86D91CdIPz2Hiod/ma+eTVhR944W4rmb0YJZ64
 6nnR4HNFj8yzGSw/Iq1UvVNPaHR0tUI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-Vp1tmOl4OCmyMgHLz-EBmw-1; Thu, 11 May 2023 02:46:22 -0400
X-MC-Unique: Vp1tmOl4OCmyMgHLz-EBmw-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-50bcc3ee913so7563911a12.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 23:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683787581; x=1686379581;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sW+z+jkbQZIZpHKYRiq845AkViqpdLMGu0OSZmujFVE=;
 b=geqeAI7virkfwROeApIiMv1oAi4OOxvVuPjTnH+JS3uYkP8jbdMDnujc1JidpTI2mO
 nquay+VzYWv3SaCjv5NbYkk1iN1NsWUrIlHEd8XtBxtHmkFGsxLOJWm6/DlDZDSEZwjR
 q7sK+F3j5BGZUY56/NFxQQqBxiU8TMWzBb3WJXHXjYjAzSU80oGpmJ1f4/5HXs9iFeF2
 3WJi7gdcwlfyTotFWTUPMF82Yyh2I4rfwTxS6xdc4dWIOuRvmPPxYtsOBtWFd6GjUkEZ
 cMhRkfB2yINWmQb3LVeWhrWFjtbHf2dHEPXj/hSctGAM6EtRXPlrqdH7zXhdXMBfo+tr
 azoA==
X-Gm-Message-State: AC+VfDytwrnvpZ6MaDqJyf3aZx+tcuABtU0v1HyxAZB7f4ABXCqw1fkY
 /gMXHPYWWxm4FFFzt77Oj9IkXPT9aBq8PPA/bSYss4JctscurMGVtxSHewA7I+iFD3dMz87BUV+
 qBpIwX7ZFxaNqaMg=
X-Received: by 2002:a05:6402:202a:b0:508:5062:8d8c with SMTP id
 ay10-20020a056402202a00b0050850628d8cmr15788295edb.22.1683787581314; 
 Wed, 10 May 2023 23:46:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6HZxy0bbqdD3rWGAanI1OIXjERITyX5QwWfKtm3vPF4vreYGYjtABBs56ISivwUYnLixFUpw==
X-Received: by 2002:a05:6402:202a:b0:508:5062:8d8c with SMTP id
 ay10-20020a056402202a00b0050850628d8cmr15788286edb.22.1683787581071; 
 Wed, 10 May 2023 23:46:21 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-67.web.vodafone.de.
 [109.43.177.67]) by smtp.gmail.com with ESMTPSA id
 d20-20020aa7d694000000b0050bcbb5708asm2615657edr.35.2023.05.10.23.46.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 23:46:20 -0700 (PDT)
Message-ID: <44a807d9-3682-7da1-a6e7-2b411656d265@redhat.com>
Date: Thu, 11 May 2023 08:46:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] docs/about/emulation: fix typo
To: Sh4w <sledgeh4w@gmail.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org
References: <20230511022905.98241-1-sledgeh4w@gmail.com>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230511022905.98241-1-sledgeh4w@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.251, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/05/2023 04.29, Sh4w wrote:
> Duplicated word "are".
> 
> Signed-off-by: Sh4w <sledgeh4w@gmail.com>

Thanks for your contribution, but please sign patches with your real name, 
QEMU does not take patches that are signed with a pseudonym.

  Thanks,
   Thomas


