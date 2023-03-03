Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 322816AA3AC
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 23:03:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYDTZ-0006l7-Ig; Fri, 03 Mar 2023 17:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pYDTU-0006jZ-V9
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 17:02:02 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pYDTT-0003ck-Gc
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 17:02:00 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A3F7B1F750;
 Fri,  3 Mar 2023 22:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677880917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lzi5tVOXouAXb8wZVLwbSewlXVOX79OVF7zs3hozx0w=;
 b=DFEdqiztV5fzj0PYi0Ak2GJchiAPTff9utn6nzgDw6UVhHE2VmkWeBVO9LXvx7Yv8CwfVI
 V9XM0in3Ratfr9aexWGLBSO6vsV80rWmv9ZdaeXVBpQxYH0kB14eWgDA3IzL65FwZ0PME9
 xqVUp6e6uds0ZI22dyJzaQ/dtMjTbtc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677880917;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lzi5tVOXouAXb8wZVLwbSewlXVOX79OVF7zs3hozx0w=;
 b=/FmOMkcVqjJ+d9PbE/HdRdTdEFcJtrWNZbAcfln66kJ8FjiDVuRPFh5sbIaOFW3/xCD1jJ
 vH7pMu592eVLegCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 304B9139D3;
 Fri,  3 Mar 2023 22:01:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zxV3OlRuAmRvZgAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 03 Mar 2023 22:01:56 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>,
 qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, philmd@linaro.org, tsimpson@quicinc.com
Subject: Re: hexagon: check-tcg rebuilding up to date image
In-Reply-To: <3ccca5373de05be28b861c0e9e780c709703f0f7.1677862556.git.quic_mathbern@quicinc.com>
References: <3ccca5373de05be28b861c0e9e780c709703f0f7.1677862556.git.quic_mathbern@quicinc.com>
Date: Fri, 03 Mar 2023 19:01:54 -0300
Message-ID: <87mt4twl2l.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
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

Matheus Tavares Bernardino <quic_mathbern@quicinc.com> writes:

> Hi,
>
> We noticed that local `make check-tcg` is rebuilding the docker image
> for qemu-hexagon at every run, whereas previously it would say "Image is
> up to date" and move on.
>
> This was changed at 0b1a649047 (tests/docker: use direct RUNC call to
> build containers, 2023-02-28), where we started to no longer use
> docker.py and its image_matches_dockerfile() to skip image builds.
>
> Is this new behavior by design? Or perhaps do we have some local
> docker misconfiguration that is not correctly using caches?

Hi,

We started relying on docker for the cache. Are you using docker or
podman? There should be a RUNC variable in config-host.mak that you can
check.

And for the record, which version of either podman or docker?


Alex, 

I think we might need to add DOCKER_BUILDKIT=1 $(RUNC) ... to properly
make use of caching with docker. As for podman, I'm seeing conflicting
information on the web as to whether it even supports caching.



