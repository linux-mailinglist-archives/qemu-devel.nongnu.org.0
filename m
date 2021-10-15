Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8530A42E62C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 03:34:10 +0200 (CEST)
Received: from localhost ([::1]:38930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbC6r-0002Pb-FF
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 21:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mbC5r-0001iL-Cl
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 21:33:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mbC5n-0001E8-Li
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 21:33:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634261581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tmwySfjHn4vjZdlG8Hjq+/FJl0GlA9U8I/srI145XpQ=;
 b=R12h2prDoseadluJFyiqsIYuc581QLVjzSdIijQxJcEwuBBSP7TCyQJ1BWZKxbFwrfIJZk
 hGYY4SboFmTYe4tIZVvl4mzEsHWsF7OkP5aQEw7BXZ38Qs3s33MBFWGf065lFRlQiXJsE9
 yOjR3IgVa8wcPBBXIdOfIOEGgkodNK8=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-OvHzbO0kPGynA388FuXjNg-1; Thu, 14 Oct 2021 21:33:00 -0400
X-MC-Unique: OvHzbO0kPGynA388FuXjNg-1
Received: by mail-pf1-f199.google.com with SMTP id
 t79-20020a627852000000b0044d0ecd9f7aso4401815pfc.13
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 18:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=tmwySfjHn4vjZdlG8Hjq+/FJl0GlA9U8I/srI145XpQ=;
 b=mJqRN0Cqx2X2+90b//ylJgZeRzgNIM9SfyL9EP7MX63tNcD9uBbblnQi8lA8yO3cFF
 44+EY9241/cLoDC9isnONq6K1mhh0lE0tV1qBYRJtOOAEr8Ik2dqGunNhEm1FIhh2Oz1
 drr7J4ac3Ahxh/LInC8SXQxYaP3vfZVoiSJEkcaIoVeWAmhmaEs2jb3BU7yJxOmMPC+V
 CSi6QdONUKuJofp+fS11rh0wvhaAui2x24+SdmHKXXmGP4/zjRvlNY8wXNkVL2u9ZPWF
 rru0CN1Ej5RRfmPOYMciXI0FW9jrBEY09DNa62rmUKpnhkECl4/4sHi6yYgr6S5xfe2w
 tRIw==
X-Gm-Message-State: AOAM532NYTRmOpSzH/zw9oATgCueitEOjRxkswvlXir67CfVF4Gwnnlu
 42d7lf9ON6i0NhlMw7OJCaIh2FJZXIAwnZnG48KOcyMuhV9DENbpeXx8m9wIRZT1Q/MNxeKzA5f
 poatR+QBU8uXHKa0=
X-Received: by 2002:a17:902:ce86:b0:13f:4b5:cdde with SMTP id
 f6-20020a170902ce8600b0013f04b5cddemr8256498plg.22.1634261579071; 
 Thu, 14 Oct 2021 18:32:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHiJorJZ+hZGrZBVp7Xbzzd23Fk0zU9I8m7HBbrov3pl+RcGU07mramA9qb+GCH0wWM8uG4A==
X-Received: by 2002:a17:902:ce86:b0:13f:4b5:cdde with SMTP id
 f6-20020a170902ce8600b0013f04b5cddemr8256470plg.22.1634261578695; 
 Thu, 14 Oct 2021 18:32:58 -0700 (PDT)
Received: from t490s ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id d137sm3671610pfd.72.2021.10.14.18.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 18:32:57 -0700 (PDT)
Date: Fri, 15 Oct 2021 09:32:51 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v12 0/6] support dirtyrate at the granualrity of vcpu
Message-ID: <YWjaQ80LZGvPPoeX@t490s>
References: <cover.1624982116.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <cover.1624982116.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 30, 2021 at 12:01:17AM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> v12
> - adjust the order of calculating dirty rate
>   let memory_global_dirty_log_sync before calculating as
>   v11 version description.

Ping for Yong.

Dave/Juan, any plan to review/merge this series (along with the other series of
dirty logging)?

I found it useful when I wanted to modify the program I used to generate
constant dirty workload - this series can help me to verify the change.

I still keep thinking this series is something good to have.  Thanks,

-- 
Peter Xu


