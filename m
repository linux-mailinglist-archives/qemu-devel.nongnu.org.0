Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C44F475A9A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 15:23:26 +0100 (CET)
Received: from localhost ([::1]:54010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxVBl-0005XD-4u
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 09:23:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilias.apalodimas@linaro.org>)
 id 1mxUYr-0000Xl-Db
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 08:43:13 -0500
Received: from [2a00:1450:4864:20::334] (port=40896
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilias.apalodimas@linaro.org>)
 id 1mxUYp-0001cg-La
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 08:43:13 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so18505036wmj.5
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 05:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=9nEdcr5p8OcHxve1Z5DC5oBdMvprAMYX5tTrlQkG1E8=;
 b=k5nsBURW0k2O5pBVlRPQYuFcXgIty+uBN5CKoxVY9lgwUjz1pmAHmHG9kDiVBiOvZq
 zRbX+OpqWz/VJeGw8S1lJtef/xvnmYxtJEGVyPhuUlnDW7m0UQ56HCqZlmlzKYviBnKv
 7hIjKHHiNIeNGvluYGdInwIG1W3lvqk4bvKaa/8qd7of19J9rpmbWLyAZXbazYkHRrn+
 Rrg9HSKejq7b5EcJIFVmdpEbvMhNPZqD6qzE9M/WjZomUEgz5oJkHgijUi+o5ZUEL7My
 CV3HCvE9lqrbhulLkL2qhyFOwQJCAQvO+YlyMXY7TL0nV+ww466cTHAX1OJnqwzIoJ8R
 Qu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9nEdcr5p8OcHxve1Z5DC5oBdMvprAMYX5tTrlQkG1E8=;
 b=sF1Yb6NVEB/hqAgsLRy8wuKpEh6UzDtQC4RqqkBH9kImEx9jWi3ki6KK1np2Kv2Qdd
 vXLTLTqGzVCDSDMjvZWqqafjdgk12sQVKUprwk73Ve4+EYx7TqypeJH45HrBUpranpGF
 k9vk+xC/Gx+HRCeh5XmOEgqkEVS/MxtN6pdCvLvDBC2Ko+Le0vR45i34CBPFhLFm5Lx0
 JHBLQuw7srF4SH0P1eyuQM67+lE74kwHex9qjgfF5G6W0CivwXzafV3rk9bcDCWb0Mj6
 4iXs+xQKpo/KVVGoYWhRcbk8olHKuQ8RKMVk1R12nFNQ3yysjwZp5vLaz0wKk2ktU+Ag
 U1nA==
X-Gm-Message-State: AOAM532MHFxgzUmas3djQfK0FmofkPoMHTjhfhxkmNblczPPYwzVCyf5
 dKOvHcqP191QcoVLNnETmKqhJA==
X-Google-Smtp-Source: ABdhPJzPyexGYnwdRdap/znx5OEHb+pRJO5tXSkPES0lYwvrRzNtXakaHDLsM1WCM4KRiy/cKOdhmw==
X-Received: by 2002:a05:600c:2304:: with SMTP id
 4mr1896406wmo.71.1639575790169; 
 Wed, 15 Dec 2021 05:43:10 -0800 (PST)
Received: from hades (athedsl-4461669.home.otenet.gr. [94.71.4.85])
 by smtp.gmail.com with ESMTPSA id w15sm2038057wrk.77.2021.12.15.05.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 05:43:09 -0800 (PST)
Date: Wed, 15 Dec 2021 15:43:07 +0200
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/arm: add control knob to disable kaslr_seed via DTB
Message-ID: <Ybnw6+lOQPInzgqz@hades>
References: <20211215120926.1696302-1-alex.bennee@linaro.org>
 <CAFEAcA_psjs5vaCZ06oU_OwSYorED4zgg+y-eD4nN5X2sRBVRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA_psjs5vaCZ06oU_OwSYorED4zgg+y-eD4nN5X2sRBVRg@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=ilias.apalodimas@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Jerome Forissier <jerome@forissier.org>, qemu-arm@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter

On Wed, Dec 15, 2021 at 01:36:07PM +0000, Peter Maydell wrote:
> On Wed, 15 Dec 2021 at 12:09, Alex Bennée <alex.bennee@linaro.org> wrote:
> >
> > Generally a guest needs an external source of randomness to properly
> > enable things like address space randomisation. However in a trusted
> > boot environment where the firmware will cryptographically verify
> > components having random data in the DTB will cause verification to
> > fail. Add a control knob so we can prevent this being added to the
> > system DTB.
> 
> Given that the DTB is automatically generated for the virt board,
> firmware has no way to guarantee that it's the same every time
> anyway, surely ?

The firmware needs hardware assistance to do this. In order to have some 
guarantees on the loaded DTB, the firmware measures and extends the TPM PCRs.
In that case you'd expect the measurements to match across reboots assuming 
the command line hasn't been changed.  The kaslr-seed is obviously a deal
breaker for this. 

Thanks
/Ilias

