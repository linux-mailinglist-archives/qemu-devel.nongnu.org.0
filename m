Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0266BBE45
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 21:58:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcYAx-00019V-6K; Wed, 15 Mar 2023 16:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcYAu-00019G-3f
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 16:56:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcYAs-0001x2-ER
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 16:56:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678913800;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=KQQGxNXqLqUh0iasPy2b44a8l+JmMbcgHDn6bnsefmc=;
 b=fbYNM/Q2hfjh56ugrUMydj2vbLdPstSKQtwWN7TNHrkArEdxyjZuYu+k7K4Kn5w2SE88Ve
 99Bxm4pRRE4bp4e1wc4ilyHOPE/n9G6Cy/Qu2vMSxa+kfdDggpMJ2eP3nDMZh2Xi0iBWKL
 nRKTB8LeRKlr2EpTuGRxrdQYNwpY9xI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-UFZ_scslNr63yj88bEyWPQ-1; Wed, 15 Mar 2023 16:56:39 -0400
X-MC-Unique: UFZ_scslNr63yj88bEyWPQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 k18-20020a05600c1c9200b003ed2a3f101fso1520161wms.9
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 13:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678913798;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KQQGxNXqLqUh0iasPy2b44a8l+JmMbcgHDn6bnsefmc=;
 b=CinqRHLEX2qWgcC4zfJIViZNkKycgFQZJBxXtgwkEGKHmsabYkt0XfYos6qZbzGr0r
 hC7RElS5Fgv0oLp+CI3oPi++Fvp5YqTxM7NU2KnWBJznZu+TcqdtdXzIvR50JGIjQp2n
 VAfAb/8SVG4U8QzLnzPDRWYaCHzN6gQkQwXC1bjRT5f+PTtV4H63na2suzlcWkVPlINA
 2anwoKnNMpojp+rLWXpVN6iKLvvXQwDDhc4SiuI2nc/mCwo7fIH+ufVJj+7I9KK9FyOh
 Fdbud+gAMToM3dsyBuM/xN2PpvuCiIIgwpv5M2RLaQw0ghDmVPqHJOlN6qNpDtyO3FPL
 1QFg==
X-Gm-Message-State: AO0yUKWh1uceNbTKI6SQjAVqkVN+TwWBnrTy4DfyttVCpxZ4j47hgLeQ
 MkNtzkkQkZ/yrOvAhbRS1JZKWgGcuv/o9GGKmsopz5nJXprNWQ0oJMFz+LKwrlg5SNLzkVfQabA
 K4y+xdU5h4jJjv6U=
X-Received: by 2002:a05:600c:1c0a:b0:3ed:22b3:6263 with SMTP id
 j10-20020a05600c1c0a00b003ed22b36263mr13189096wms.12.1678913798246; 
 Wed, 15 Mar 2023 13:56:38 -0700 (PDT)
X-Google-Smtp-Source: AK7set+y8Bdw9SyF0QLt8uXQdW24/WWsEpc9UAUrX6RSsX7Rp3sLlFQpdDCKI/XN3hJEfOUjJsA9Kw==
X-Received: by 2002:a05:600c:1c0a:b0:3ed:22b3:6263 with SMTP id
 j10-20020a05600c1c0a00b003ed22b36263mr13189089wms.12.1678913797986; 
 Wed, 15 Mar 2023 13:56:37 -0700 (PDT)
Received: from redhat.com (62.117.238.225.dyn.user.ono.com. [62.117.238.225])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c198e00b003ed29899dfdsm3169328wmq.21.2023.03.15.13.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 13:56:37 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Cc: <qemu-devel@nongnu.org>,  <bcain@quicinc.com>,  <dgilbert@redhat.com>,
 <ling1.xu@intel.com>,  <zhou.zhao@intel.com>,  <jun.i.jin@intel.com>
Subject: Re: [PATCH RESEND v2 1/2] migration/xbzrle: use ctz64 to avoid
 undefined result
In-Reply-To: <117f3c2fdc17c319b0e04014bbd7e0c94992c197.1678733663.git.quic_mathbern@quicinc.com>
 (Matheus Tavares Bernardino's message of "Mon, 13 Mar 2023 15:58:19
 -0300")
References: <cover.1678733663.git.quic_mathbern@quicinc.com>
 <117f3c2fdc17c319b0e04014bbd7e0c94992c197.1678733663.git.quic_mathbern@quicinc.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 15 Mar 2023 21:56:36 +0100
Message-ID: <87ttyln37f.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Matheus Tavares Bernardino <quic_mathbern@quicinc.com> wrote:
> __builtin_ctzll() produces undefined results when the argument is 0.
> This can be seen through test-xbzrle, which produces the following
> warning:
>
> ../migration/xbzrle.c:265: runtime error: passing zero to ctz(), which is not a valid argument
>
> Replace __builtin_ctzll() with our ctz64() wrapper which properly
> handles 0.
>
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


