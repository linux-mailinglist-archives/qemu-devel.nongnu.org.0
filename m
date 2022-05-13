Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A29F3525FA0
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 12:18:52 +0200 (CEST)
Received: from localhost ([::1]:56346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npSNn-0004WF-OO
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 06:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1npSKo-0003CV-Mp
 for qemu-devel@nongnu.org; Fri, 13 May 2022 06:15:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1npSKk-0001C2-7h
 for qemu-devel@nongnu.org; Fri, 13 May 2022 06:15:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652436940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NingSYY6MRmyffgzM9VikAhkn/C6w3qrpyyy0iup4xI=;
 b=fAs00qYu71g8mFzL8h1cbNHIUWhH9Y2vNQ3OEc+5FLXTpxkgU1s3ZosnAYJgPyfiEMu8tM
 N2r+iZMCO+hx/wwd0ISG+cu+HL2Sv3FLsOprdLgc0uYfjwHC1+Px8EFqG8jmQIyZu9l+hR
 6HB+oDVvCJdv8kRFnkCkRrQPr/2FbS4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306--rUncnEEN76FWVihBhgSdw-1; Fri, 13 May 2022 06:15:39 -0400
X-MC-Unique: -rUncnEEN76FWVihBhgSdw-1
Received: by mail-wm1-f69.google.com with SMTP id
 i18-20020a1c5412000000b0039491a8298cso2862881wmb.5
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 03:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=NingSYY6MRmyffgzM9VikAhkn/C6w3qrpyyy0iup4xI=;
 b=w/jcKeR0eEvWSxZnVEDosNtokKkOggdSRz4+iV8YS+NAr8d6LSe63i1uITsenKl5X4
 4h9RwCTloRZtiGFRnbFVCksbG9KohaMyraAeBW3MndeNVIXTEgmg5BVgl0FeuW/5mO17
 oc00NtiEdTmCUvbfYFEo1QK0/RauRi/CLFT99QyDPRnJM9lw7te9tGc1aqy7P2Ou4Heq
 1K9szi1H7hGxDI/JMfG1gSoWiJXk9UNaPUvFR3/xhVGyiO7BA+NXIabRCAzQbZ3BKJkb
 +DEcJiwwNZFiM1kgANojrOGxeYjN2+R5ffyOi01LMUyNuzX4Gcg+IN0zd92fJyhxTRpC
 BJOw==
X-Gm-Message-State: AOAM531k/Lhb6DDUHnCIENR8Cd2xD+i9ry768wWdaUacMnJ10MHnw8yu
 ds29xVFfH+ZWMKu/ykMWujIPzmi3URTIqBL0kur//vfOimrLFaUPxJGaqx1EoT7S99RbKLxDt7c
 Lct+b3fxBKj7vDJs=
X-Received: by 2002:a7b:c199:0:b0:394:26d0:a6a9 with SMTP id
 y25-20020a7bc199000000b0039426d0a6a9mr14336708wmi.116.1652436938292; 
 Fri, 13 May 2022 03:15:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoIdPMETByf9nRiQg3yZZyX2j7VpxcBXgJpXxbdejA6PR4hw7IBSXesHf1B76OEE/vCSil9g==
X-Received: by 2002:a7b:c199:0:b0:394:26d0:a6a9 with SMTP id
 y25-20020a7bc199000000b0039426d0a6a9mr14336680wmi.116.1652436937987; 
 Fri, 13 May 2022 03:15:37 -0700 (PDT)
Received: from redhat.com ([2.53.15.195]) by smtp.gmail.com with ESMTPSA id
 i10-20020adfb64a000000b0020c5253d8bbsm1823809wre.7.2022.05.13.03.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 03:15:37 -0700 (PDT)
Date: Fri, 13 May 2022 06:15:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org
Subject: Re: [PATCH  v1 00/13] various virtio docs, fixes and tweaks
Message-ID: <20220513061359-mutt-send-email-mst@kernel.org>
References: <20220321153037.3622127-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220321153037.3622127-1-alex.bennee@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 21, 2022 at 03:30:24PM +0000, Alex Bennée wrote:
>   contrib/vhost-user-blk: fix 32 bit build and enable

I applied up to this point. Pls respond to Philippe's comment.

-- 
MST


