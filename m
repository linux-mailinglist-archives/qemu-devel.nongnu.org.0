Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDC466440B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 16:04:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFEXr-0006ne-Vl; Tue, 10 Jan 2023 08:20:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pFEXn-0006m3-Gn; Tue, 10 Jan 2023 08:19:59 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pFEXm-00022s-2n; Tue, 10 Jan 2023 08:19:59 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AB5C63E702;
 Tue, 10 Jan 2023 13:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673356794; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TYBcXyviBMBxf9BmBzjVP8C3CJPvVNozAUDdQQv96kk=;
 b=Qxf//jZs6QLcaL6hGUHUVp3unjrxCFpLk9qg9NDkUScW+3ZRb2PdmTjN952+t5AI7eao4Z
 nbS+hi177hK0rt2Ygpu3cGWkik0yWWM7UNaZEhaIssV4Mhi/Pr2Ogsb8UgEQ+SmjYc2reQ
 j9KxjgFQedK+lppPG8NIRMthZDgxVCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673356794;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TYBcXyviBMBxf9BmBzjVP8C3CJPvVNozAUDdQQv96kk=;
 b=Ay3Fg18Po7nnmWoun7IFHQ045LnaLscYq51twl7LqpkB95Rs5IX/8MkeDZqAIAC70tBULb
 2fNg9trhmsXUz1Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 296EE13338;
 Tue, 10 Jan 2023 13:19:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jjEcAu9lvWO9NwAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 10 Jan 2023 13:19:43 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
Subject: Re: [RFC PATCH v2 07/19] target/arm: Move helper_set_pstate_* into
 cpregs.c
In-Reply-To: <c1541118-b5fc-d39c-cfc9-e4fa2d83c801@linaro.org>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-8-farosas@suse.de>
 <c1541118-b5fc-d39c-cfc9-e4fa2d83c801@linaro.org>
Date: Tue, 10 Jan 2023 10:19:40 -0300
Message-ID: <87v8lea5n7.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

> On 1/9/23 14:42, Fabiano Rosas wrote:
>> We want to move sme_helper into the tcg directory, but the cpregs
>> accessor functions cannot go along, otherwise they would be separate
>> from the respective ARMCPRegInfo definition which needs to be compiled
>> with CONFIG_TCG=n as well.
>
> Hmm.  I would have hoped these could stay tcg-only, somehow.
> I wonder if it warrants being an ARM_CP_SPECIAL_MASK value instead of svcr_write.

In general, what characterizes as "special" for a register to use
ARM_CP_SPECIAL_MASK?

And specifically for svcr_write, it seems to me that
helper_set_pstate_{sm,za} and arm_reset_sve_state are straight-forward
enough that they could (if it made sense) be used by non-tcg code
(except they eventually call vfp_set_fpscr that still needs to be
split).

>
>
> r~

