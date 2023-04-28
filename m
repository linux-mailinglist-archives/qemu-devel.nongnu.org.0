Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3386F1D6D
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 19:30:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psRuU-0003Ms-EV; Fri, 28 Apr 2023 13:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psRuS-0003Mh-Sc
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 13:29:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psRuR-0007vx-I3
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 13:29:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682702966;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ek1D2CO+eEulG+F4QO31HAwxBh7BSMn3l3je6BaEEQU=;
 b=IRTsu2XsS+QJ8+ohOk8Kyil/GyVgwhUFcsj5P6XhQniwnd0CxIDbAQMT7yMycLMMKx9cGh
 bD752DZYg1ki781StFjVN88JxQ50l9tdqwQ2zYyCH2RhVJMfuRJCPL6gwZcjlE8VpajmQF
 YUXyzqJDytI3KKJX359+yA48f+uCcWM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-NkgzI5k0MPGCSQFO3icxzw-1; Fri, 28 Apr 2023 13:29:24 -0400
X-MC-Unique: NkgzI5k0MPGCSQFO3icxzw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f065208a64so62391985e9.3
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 10:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682702963; x=1685294963;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ek1D2CO+eEulG+F4QO31HAwxBh7BSMn3l3je6BaEEQU=;
 b=LOzJoIiTICUZ9mbo2aqL6Vag152K5FGSN+LSFnI8puxS/nNqdiRL2g24DfJ3N7NbVQ
 9KePAOl6bwJhRAWpoEfZOHUsY7eyKZwoSVI0lnMt7i50TswV5xbK4xLl+xuG7nNNrLy3
 VGGC3OjQ6trTxSPnDXag63HHzp3qSkF1RZqB/rcd4BpSM2d0hF5111xFdBsXdHlV90KS
 cKYaYyk2E2hDbB7QftLh7B4sb3cSVGVIXmM4VjdoDykF3NzYBIQnUTqQQ8eBpB5NlqCG
 xeXssd/FqS/rFXc4hPMj3uX85IC51pq0TGmT33LO6cOh4VZHDKni7bqOwMZ9djZlpVsf
 9M9A==
X-Gm-Message-State: AC+VfDwxupUXSNEQUN9K/4vOSLTgN0Xft7k1u751kNW66/QaJx3khFSw
 J62sSQ3o8bj2SDxx258Yf1mVSf7+PXVwf4iEPvIG9sLJGC58u7D52YUnHyLlDUSwz/sz17/8dlu
 5ahuLvl9eapZX0I/ulMe+R3aV03zx
X-Received: by 2002:a05:600c:2189:b0:3f1:6fca:d5a5 with SMTP id
 e9-20020a05600c218900b003f16fcad5a5mr4194415wme.17.1682702963286; 
 Fri, 28 Apr 2023 10:29:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6bJVlrsgtJevhonfdB2/OF7dpF6iRtEbLgLODH+NH/NN7LRgBs4hk5NK194E9Nptb228gkFw==
X-Received: by 2002:a05:600c:2189:b0:3f1:6fca:d5a5 with SMTP id
 e9-20020a05600c218900b003f16fcad5a5mr4194405wme.17.1682702962910; 
 Fri, 28 Apr 2023 10:29:22 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c468500b003f18141a016sm28031694wmo.18.2023.04.28.10.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 10:29:22 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 13/13] ram-compress.c: Make target independent
In-Reply-To: <aeb66513f419d1be4601393a20f73801ccfbe80d.1681983401.git.lukasstraub2@web.de>
 (Lukas Straub's message of "Thu, 20 Apr 2023 11:48:35 +0200")
References: <cover.1681983401.git.lukasstraub2@web.de>
 <aeb66513f419d1be4601393a20f73801ccfbe80d.1681983401.git.lukasstraub2@web.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 19:29:21 +0200
Message-ID: <874jozapam.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Lukas Straub <lukasstraub2@web.de> wrote:
> Make ram-compress.c target independent.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>

Reviewed-by: Juan Quintela <quintela@redhat.com>


