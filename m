Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C6666E530
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 18:47:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHq2y-0004w7-0S; Tue, 17 Jan 2023 12:46:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHq2v-0004oe-Fi
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:46:53 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHq2r-0002r0-Nf
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:46:50 -0500
Received: by mail-wr1-x42e.google.com with SMTP id t5so27017496wrq.1
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 09:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S70hy7hnAxt29XEEJxeHBbBUW/HBjwefMHzH1X/OuoM=;
 b=nVaJrH43B8VYm3paWbB2j3zDWKS6bz1QjemKtP3Uj/dnQjs5nv9C8tf/22qbRFzlbM
 7xyOg+z/OgGSCt5Ke8zT6pewuE6p98ZJfmwOfaEgSxmf83WxHWQvwv/kpuNoOPkhmxzQ
 +0/qkujhzXEm5qnmaUpE8u/yMqxSr2NG0JeJJ6cJgkp9VB1PuRmnemkjCv0tOM+aWwLM
 tQOB0CAjJ4EV7vZkhwp+Gr0xMc8wv7ihSYrirdxYE+ekVcUB3F4YS4oX+iVMx8iBSFas
 gR74eOlvou0KTpatDu1HarBdmZiNrksLRCqyvSNWBqrzyyuwxLOXi/PsgPOzE1xGdhce
 CIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=S70hy7hnAxt29XEEJxeHBbBUW/HBjwefMHzH1X/OuoM=;
 b=z5ysPZYFcNMQGvvlJdaVxUfOn3BvAs31HcypZwzJoywc6REbmDBzIRLpvblwHseEiE
 obB8vVyifnujAgrHRSwUBzEY1benDbXOhYHrERSR4jkpOtw+EED3Kvn7JPsORdMPz/78
 addif3+ghBTjDgzjrEI5u+/6Loef+RZvMX4cBG9iLitT+Lc/U0DcNHB2sDlSwgahtBQI
 klgCQDsmKHiW5hoYX63UsQTwRJNWUQuTzwQFrCh4qcqDzpNtAo05berZpgvfo1J5vB2/
 R+E3v0YPe1gqEwCQDYpg0vUZEdVZ2cIXYdzW20ixosp1vLwb2Kxyy+0L87/Gu+rypCs6
 wrmg==
X-Gm-Message-State: AFqh2krb6axpVW5Hz8tM/NHnYvCMPx/+9bUeZf3oHc97h9aRpt0mZFGE
 kx6SBLY1c1h2bd0K+yIEBtM0eBxD+dFIkYm9
X-Google-Smtp-Source: AMrXdXt1hamtpAuqfzQkByzLrNVVOI1j8RwiJtc7xpnJzrxC3w3kSQt1U4ARKOQSG7VKo4QwPMFSTA==
X-Received: by 2002:adf:e195:0:b0:2bd:d26c:ccc4 with SMTP id
 az21-20020adfe195000000b002bdd26cccc4mr4152016wrb.42.1673977608292; 
 Tue, 17 Jan 2023 09:46:48 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a5d58ce000000b002879c013b8asm29092725wrf.42.2023.01.17.09.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 09:46:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8032C1FFB7;
 Tue, 17 Jan 2023 17:46:47 +0000 (GMT)
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
 <20230109014248.2894281-4-richard.henderson@linaro.org>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 03/22] tcg/ppc: Remove unused goto_tb code for
 indirect jump
Date: Tue, 17 Jan 2023 17:46:40 +0000
In-reply-to: <20230109014248.2894281-4-richard.henderson@linaro.org>
Message-ID: <87edrt3vg8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

