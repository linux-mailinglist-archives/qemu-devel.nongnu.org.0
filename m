Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A46B93C6BFB
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 10:27:49 +0200 (CEST)
Received: from localhost ([::1]:52432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Dlc-0000O6-Nx
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 04:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3Dkr-00082r-9R
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 04:27:01 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:34322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3Dkp-0005MC-Hk
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 04:27:00 -0400
Received: by mail-wr1-x42d.google.com with SMTP id p8so29326563wrr.1
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 01:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=wWShELUnNCalgrlOF50Be3CeFB08f8JwN9XYCytZmtQ=;
 b=hY5xYy8z8/B0GDG+j/ujiwp2Pn+jvyQU4N9/FwDOEethYVxm245D/L3672/YJzLd51
 R+PPyl/8X0Epp7FhZAIwHMk8dCyVrcKi3dEuHI4KfsDyw1AqeHIzBk6tlYsNGh2M80pt
 mfvwWPHJ10k5wFyM7bvNDDrkCrH1CaY4PjVZl3Z6eoFRmSOlz9mbfHzdpPodTdDiaZzU
 5vin47utA5IwENOESOuol2hjVqf0Zm06XkCB/BTSi1/BjQgwuJbTVXhNJOke4ESya+DL
 hLXRaQpgSpljfQkqituE/3rwZNHoGp8JIbIjdWfWhCIcwfr3CxOAoViGCrMcKzZgDF7W
 De/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=wWShELUnNCalgrlOF50Be3CeFB08f8JwN9XYCytZmtQ=;
 b=ZOYJW8t5npC82u2BUetmzaQ8t4U47L/1ym6k9Rw26Boif/oexz1Ro03paVPegHRV+p
 O2Tk3jXsn2tvuyLLNXiE2ZkFCL8EzEGOZDLnF3R6jSNMsaBRBV1wZPOT0Bx6zBhfu8ql
 LOD3t4EpyIIXbv5/xcpC8isbbphSYX4rwt5FUqOVXZryqLxOxcKsS3lPt2YWuS2kSsht
 EUyCpYyhnqG0Bz1BqHkWVrChIr/L81EtHLLzTBhZJa2RNOXDqm4AJUBQkRePl93gMsJV
 xV3GObNbKaXqck1iF4Punct4yuJuJAY83R1pSmlh9vit1UDd0jkoYeWyvs19Mxxwr5rQ
 hWIw==
X-Gm-Message-State: AOAM532t1Jp47H/4bw2kOGoIPTVN109D/W/w2CXCkpF7ZooGMgNOy9Wg
 wzjbq3mJ9h8rBOHHxDhJMnUbbw==
X-Google-Smtp-Source: ABdhPJyyHLcgSmmc3DjfSxI7cTMKWh8AgcTKoI6DkNl0wTBNex3ZQ8Vmtd8XPoyg8Fwt65WNjhnZ+w==
X-Received: by 2002:a5d:550e:: with SMTP id b14mr4202943wrv.16.1626164818009; 
 Tue, 13 Jul 2021 01:26:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y11sm1596669wmi.33.2021.07.13.01.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 01:26:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 553721FF7E;
 Tue, 13 Jul 2021 09:26:56 +0100 (BST)
References: <79262dbe1f7888eb02e1911501eebafa6f2f6400.1616583806.git.viresh.kumar@linaro.org>
 <877djl3d78.fsf@linaro.org> <20210713032453.edryxntclvrkko32@vireshk-i7>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] gitignore: Update with some filetypes
Date: Tue, 13 Jul 2021 09:26:38 +0100
In-reply-to: <20210713032453.edryxntclvrkko32@vireshk-i7>
Message-ID: <87a6mqvctr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Viresh Kumar <viresh.kumar@linaro.org> writes:

> On 26-05-21, 13:13, Alex Benn=C3=A9e wrote:
>>=20
>> Viresh Kumar <viresh.kumar@linaro.org> writes:
>>=20
>> > Update .gitignore to ignore .swp and .patch files.
>> >
>> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>>=20
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> No one picked it up yet, do I need to do something here ?

As no one else has picked it up queued to for-6.1/misc-fixes, thanks.

--=20
Alex Benn=C3=A9e

