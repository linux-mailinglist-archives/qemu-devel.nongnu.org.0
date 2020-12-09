Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DC22D4113
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 12:30:36 +0100 (CET)
Received: from localhost ([::1]:37344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmxg3-00025l-CE
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 06:30:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmxer-0001fl-Uw
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 06:29:24 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:51380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmxen-0008Uf-RL
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 06:29:21 -0500
Received: by mail-wm1-x32e.google.com with SMTP id v14so1150040wml.1
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 03:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=U0TWIVHPQ7j4KXnKzm7OBKVxRoFmUdtxX4Qv8HQplTE=;
 b=EwOm7V7IhkGrB2dQcFki5CfD4bPEMn3hmYq1Qy4rR6nHcVQCmGOVoFR9cfBl6lxWHA
 MCOjrlMgk3Khc5M+wq6MoBg0coqJ4rqgP2eMSPVRZZwgPKMYkFLjVoslzzoKGtKvFqNj
 Zt7BxxgK+rZlB/URP5LxKpn1PauxvLu/i4e21AATs/u8CtwnOfYTQK0KRGMxRM2WLGiN
 euHYgg19ml2BkfyPCe7NvtLfnI0em3KwBriuVmyb6j4YjHf5QFhxJXWXRo8lLjxe/YOa
 mz1Z+NU9uS39DuAS6lxlvRRuCQ2GcJL/EWfeMtFIiUpcjxwdhZcB+Qy+jJJnqqhojOjV
 i8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=U0TWIVHPQ7j4KXnKzm7OBKVxRoFmUdtxX4Qv8HQplTE=;
 b=qZeaAZsm+NFou8+uCgAP4kb1oK/0XuuPsEx2z/0I9B+ocZA/0+L6JbVsC3mADVfGHk
 CJixRxfmhU10+z/BAsBdjMvOchxklhMUqpt3mPF/NCBLaFU9Pv5q7XyTV++JTjjCNv/m
 KqazTaJnSlVQGgXLGDhvSvBG/H8B5BaGd22dUkoMRXzD5VLhDJN5udMcckGjoVse/tkC
 4tLJTFXGObnwXMQyW1qYbX/FjqrAo1IVyJRp4DYOj6i3Za1kYd+yHlvk7wT6KigHTmnr
 4B3Sx1dlnDb79b4a0Kv0tE91aZduFWR2QsV1FR9peYfT4WnGugpHk/d0fryNIpr3iUcj
 K5Og==
X-Gm-Message-State: AOAM533IGK7lKyVsVG8meOPoRQ2g+fNpvsR4AjL+jwoc5pmNqy9/gmx7
 aMIL0zjB/DBVBPdHToxy01VYkA==
X-Google-Smtp-Source: ABdhPJyA793EnRfvNM9/LuYTRIx7f5FZ4TQWgBvcqE+gcRiFAL7iRA+xnhT7xpOPTODJgvhtzUXqng==
X-Received: by 2002:a7b:cb0c:: with SMTP id u12mr2242545wmj.11.1607513355428; 
 Wed, 09 Dec 2020 03:29:15 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q1sm2585405wrj.8.2020.12.09.03.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 03:29:13 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 141891FF7E;
 Wed,  9 Dec 2020 11:29:13 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-22-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 21/32] cpu: Move debug_excp_handler to tcg_ops
Date: Wed, 09 Dec 2020 11:29:06 +0000
In-reply-to: <20201208194839.31305-22-cfontana@suse.de>
Message-ID: <87a6undxpy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> From: Eduardo Habkost <ehabkost@redhat.com>
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

