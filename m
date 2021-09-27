Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1059B419DA7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:56:06 +0200 (CEST)
Received: from localhost ([::1]:36456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUurF-0003MD-3j
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUupA-00025W-0A
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:53:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUup8-0003by-IS
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:53:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632765233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kt7aOeVAXf+d8zhCVHMjzczaJRbSzeUki/WknGHrz7E=;
 b=fkxSK/M33MWbVKe27ujBWK3TN8z55MzihYUErLOF+Xq+4iA/lo3qtdeYC2Fw/CbRitOvIY
 22Y7fqOPX07xqqW+60pu06akQTCF1rUYbfVCYArunps06kfwtrjs6EriLeorGAOj0wKYBs
 HPdKcCY6N77CnyMFxkkT8wnOAhE/mBg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-jC2rRmnBPR6SDENCJ2MZyQ-1; Mon, 27 Sep 2021 13:53:52 -0400
X-MC-Unique: jC2rRmnBPR6SDENCJ2MZyQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 p63-20020a1c2942000000b0030ccf0767baso521868wmp.6
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Kt7aOeVAXf+d8zhCVHMjzczaJRbSzeUki/WknGHrz7E=;
 b=LHCE5PylzDG7HgLjQB/WepuRlUnfXN5V9Ewv7jC+0WQrS3o/oljgjozQMX9WK9WpRt
 e33gV2foYf4pduHzz0IrhVyDzqqgI+g3zzuTA3qWWMSx5L2uzQM32H53VE0XSKGeF8Zp
 vQYrfafk+cM8Mm3sa2syzvprRjzWGTLpHnR2eb8vrA95gPAADxzqu2v8rAhPeJuQ7efB
 UCB1N+yH7EWVM1JuqB6QQaDWZItmYdc1jGiW85yj8uZijNpZDVXpsgMMF0DjOdvXvbu0
 62LeNzBtuM6bzwXO4hMBGGdHieHu8VqIWidXIPTtsuDLT1er0j5TVzTRho5Ur/kFF2y2
 yFPg==
X-Gm-Message-State: AOAM530ISYfa6YzuEWQPtYlhbnt8BRle+ZjOXNXFJkgchZQYiW1cwvCq
 KHbHN9y3wywqq5LsJREYMtGUPFPswzfra3ZVGBrrd0QM0siH6PPQnJR7pkyfjTXe1im/ZhK9pmg
 BeiIjLQH/r2GkcBA=
X-Received: by 2002:a1c:f705:: with SMTP id v5mr408240wmh.18.1632765230738;
 Mon, 27 Sep 2021 10:53:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeWbcNB5vFgsiUT7hN/hzd6adShYv4r05j9U2OuqcSyBXmWeaCP8OLRuMJ6m8KF5hNa24M1w==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr408226wmh.18.1632765230526;
 Mon, 27 Sep 2021 10:53:50 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id r6sm588526wrp.41.2021.09.27.10.53.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 10:53:50 -0700 (PDT)
Message-ID: <2827cbe1-4e7e-9579-e15c-80b52e53fc41@redhat.com>
Date: Mon, 27 Sep 2021 19:53:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/2] 9pfs: simplify blksize_to_iounit()
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <cover.1632758315.git.qemu_oss@crudebyte.com>
 <b84eb324d2ebdcc6f9c442c97b5b4d01eecb4f43.1632758315.git.qemu_oss@crudebyte.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <b84eb324d2ebdcc6f9c442c97b5b4d01eecb4f43.1632758315.git.qemu_oss@crudebyte.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.136, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/21 17:50, Christian Schoenebeck wrote:
> Use QEMU_ALIGN_DOWN() macro to reduce code and to make it
> more human readable.
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  hw/9pfs/9p.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


