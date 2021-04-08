Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21310358770
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 16:49:29 +0200 (CEST)
Received: from localhost ([::1]:43076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUVyK-0006Ud-0c
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 10:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUVwQ-0005Rn-PU
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 10:47:30 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUVwP-0005B0-8e
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 10:47:30 -0400
Received: by mail-wr1-x42d.google.com with SMTP id f12so2478732wro.0
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 07:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ZzeC+Nc93bMKMzvriAa38Vlbs9Cq/svZ4x3EkpnBR/c=;
 b=EMLD/Qy2F4B1R0hLIC2tmIj1JXF+8ZO8XUPHrejuadj1mLv0cDGeU7SarLzrB90E9v
 9GOVfihE+aUOBEtnqK8ysn6da2+7CPYHyVbkuahhsHw8LzPDuhllvABXa1R8ynrXbUL/
 af+pxGkfATqOIt1d5EHHUTQbhu5hUGWTbYJrsOdWHh8sbIcjETFXEXTKTX5A7XRoB7s/
 ZpNc/mOTr+k2SKoKYc0XNXF0a/oj/+F+bftv6BZM248NnbR4PVrNZ+lGWm12mfdaEL6R
 9einlP7hWpAqQ6rqqb2blVhzWZN1X/SX4bViVE2CXuscv2vbwnI0wBCfm5T8pXuj1QTb
 BFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ZzeC+Nc93bMKMzvriAa38Vlbs9Cq/svZ4x3EkpnBR/c=;
 b=KT1dbfuBh2bpzcI0hYPzaIA+7sof5Qp11ojKqZd5cM5mWemuY0SFAFUpsaUKHn6STh
 6vG9EbjxepNZcbJJwwVzorf3n9hEc/1hyy+vrtiNjO3dogu9gm13h5NEaP5eNkbhDVpB
 6PMDxIK68mg89oCdS2UbDqFMpLFLu0PQ6mDLXnuzSlc0u0g4i5XBukm5z/cOz3I01nLg
 Zz+vUbfqaKSilbw7u1BfStkdGYqCmLic4bnTr9LwoPY31+K5LvRfSblL+AROCtbZ0UVk
 wSJD6D+xUsze8K0PEZXeJBwNB1bcjMeh31wm4K3T24OFmsiRtYfWyBnSVVyxbaVX6GmB
 O+gA==
X-Gm-Message-State: AOAM5338aeVmuUjOSrb0IjQeD5aRQbEflBXtQPyacrNMZHHZzKHhsSYi
 AV80TiwfbtbwkFSepmN3RS81eg==
X-Google-Smtp-Source: ABdhPJzeXeHe8d+DQL8uovISMwdrkuFrIv0N6St5FlQ/ZVnE78YZ+ojWm0k43CnGFQPplGnFC0/Vlg==
X-Received: by 2002:adf:f80c:: with SMTP id s12mr619205wrp.115.1617893247248; 
 Thu, 08 Apr 2021 07:47:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g124sm15398642wme.41.2021.04.08.07.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 07:47:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B39A61FF7E;
 Thu,  8 Apr 2021 15:47:25 +0100 (BST)
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-7-cfontana@suse.de>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v12 06/65] target/arm: tcg: move sysemu-only parts of
 debug_helper
Date: Thu, 08 Apr 2021 15:47:21 +0100
In-reply-to: <20210326193701.5981-7-cfontana@suse.de>
Message-ID: <87wntcsuiq.fsf@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> move sysemu-only parts of debug_helper to sysemu/
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

