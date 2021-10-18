Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8234313CF
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 11:49:18 +0200 (CEST)
Received: from localhost ([::1]:54912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcPGf-0006mT-IR
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 05:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mcPEv-0004ak-UM
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:47:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mcPEu-0005hH-Bj
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:47:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634550446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZDvaCaN6r9hF4Vd9gKXbaXI6zfg4GPj410BKpoF3mX4=;
 b=iGoBwJWpa05b6/mkS2aEIuGpSxXVFPkGSpswaxU3swhl194KMXq3kMbP0MF7sA+F8SqGAd
 T9beY5YvP0ScfOJkPjmPe4JSYPDwJ6l0+MEZOCgC4RydJntGEW+j4HG14fJxc+N87NkpnY
 MX3FxAXkKID3K0axkHpWCVY0v1IcNWU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-UeKfiBoaPI-MXDmfYDW8mw-1; Mon, 18 Oct 2021 05:47:25 -0400
X-MC-Unique: UeKfiBoaPI-MXDmfYDW8mw-1
Received: by mail-wr1-f72.google.com with SMTP id
 a15-20020a056000188f00b00161068d8461so8669070wri.11
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 02:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZDvaCaN6r9hF4Vd9gKXbaXI6zfg4GPj410BKpoF3mX4=;
 b=cm5uQJBsN8umdh7as2sTs1JhbzAodhMX4DQH85g9s1QVFamu5EwdSLV6+PrwqJLg8o
 KPUuMFaiHAIe2J50HYg5pn26IEcOY5CPTwZmTNBV1PVQUo1MUb85foLyh3LNOJh25INX
 QhGol3qS8tzOtyRwtJgrGlOCTJwBhiHPsLuCEyE7IvmuTERZzQ110qgJdl6/Tq4tJU+i
 gT2Jzg3i3ywKgxBxwi9Uh9ABxQF6pT9YcBsObSCSzfNrfu17zQ09gsustVw+LvkmSd1M
 nrEkGzjmZqGwYtW6ckWM7DnOrcxtWk+36bZzAy7gzfkAmfMowjnM2np4hfh65Kv2Ep68
 rlgw==
X-Gm-Message-State: AOAM533zB+FQCMPfUnrm73whM6g/g6IG/4ZrIRYQE8SFLOiyUlkpYH3q
 7AjAiRXWCMI349WFw6dQq2+2EYtZWf7HZeY5PMXD9JjzW8D7DBMWHfsFh3eZ4XgpNskgSL39zO1
 NUJ065UeRWZGeE8c=
X-Received: by 2002:a5d:59aa:: with SMTP id p10mr33609231wrr.45.1634550444284; 
 Mon, 18 Oct 2021 02:47:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxN/9poy+cTJ5+XtF0Z72mAhcRaJaz9C/BxI9uXYuq0kxXoVHNVEhh06aIO3EKxTf/SOAIizg==
X-Received: by 2002:a5d:59aa:: with SMTP id p10mr33609218wrr.45.1634550444155; 
 Mon, 18 Oct 2021 02:47:24 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id v191sm12087130wme.36.2021.10.18.02.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 02:47:18 -0700 (PDT)
Date: Mon, 18 Oct 2021 10:47:16 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH] Fix %#08 misuses
Message-ID: <YW1CpMzy/LBGHt3Q@work-vm>
References: <20211014185245.69803-1-dgilbert@redhat.com>
 <db332dc2-0e17-5b16-dbbf-377b9d03cffc@linaro.org>
 <YWinkMLdThNN81Uo@antec>
MIME-Version: 1.0
In-Reply-To: <YWinkMLdThNN81Uo@antec>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, alistair.francis@wdc.com,
 eblake@redhat.com, atar4qemu@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stafford Horne (shorne@gmail.com) wrote:
> On Thu, Oct 14, 2021 at 12:33:06PM -0700, Richard Henderson wrote:
> > On 10/14/21 11:52 AM, Dr. David Alan Gilbert (git) wrote:
> > > Although I'm tempted to think that perhaps we should just
> > > prefer '0x%08' which seems clearer.
> > 
> > That's what I think we should prefer.
> 
> I agree, it's always more clear to me too.

OK, I'll rework it.

Dave

> -Stafford
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


