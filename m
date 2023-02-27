Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF236A45A4
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 16:12:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWfAI-00016E-7f; Mon, 27 Feb 2023 10:11:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pWf9s-0000xV-W8
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 10:11:21 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pWf9r-0005o5-0R
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 10:11:20 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4F4261FD65;
 Mon, 27 Feb 2023 15:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677510675; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=B+WNakosMV6Lb72jKSn2UG/J8V0WrycLQORvrKIocno=;
 b=HpuIf8+zeOBA4bzVF8HdV2WOh0elRxPocCUq9wRlsVxren8f3Ce80vS4Th0VnbbayqYS/z
 7H03EqxjZY4YhXk+VgEtFaStI4oF8j7PrRrOZbOshYRvFtFi2CbkxOY3RZIGLR5iTrWT5I
 DfEcAJa2/EQYcsV2VeRQJ45Go4MPZLg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677510675;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=B+WNakosMV6Lb72jKSn2UG/J8V0WrycLQORvrKIocno=;
 b=oN9PLKXLCdhaCygXrqB8Ti4bgkt1Mjq2TSFlbob4cNEBFUf53Cr/GIeGUnMTCKUPl5Asaa
 CeNWs0tdDFIEqEBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 550D513A43;
 Mon, 27 Feb 2023 15:11:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BVnEBxHI/GOwHwAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 27 Feb 2023 15:11:13 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [RFC PATCH v3 0/1] ci: Speed up container stage
Date: Mon, 27 Feb 2023 12:11:09 -0300
Message-Id: <20230227151110.31455-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
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

- squashed the two patches (Daniel)

- dropped the "docker pull" command. The --cache-from option already
  fetches the cached layers. Per docker's documentation:

   "Upon importing the cache, the builder will only pull the JSON
   metadata from the registry and determine possible cache hits based
   on that information. If there is a cache hit, the matched layers
   are pulled into the local environment."
   https://docs.docker.com/engine/reference/commandline/build/#cache-from

Thanks

v2:
https://lore.kernel.org/r/20230224125207.19616-1-farosas@suse.de

Turns out we were already pulling the image, but for forks we were
pulling from a different registry and for the main project we had
caching disabled due to a bug with docker/gitlab.

I've now replaced the usage of docker.py with a plain docker command
and reintroduced the caching.

I also removed the COMMON_TAG which was unused.

v1:
https://lore.kernel.org/r/20230223142154.31975-1-farosas@suse.de

I'm not sure if this was discussed previously, but I noticed we're not
pulling the images we push to the registry at every pipeline run.

I would expect we don't actually need to rebuild container images at
_every_ pipeline run, so I propose we add a "docker pull" to the
container templates. We already have that for the docker-edk2|opensbi
images.

Some containers can take a long time to build (14 mins) and pulling
the image first without building can cut the time to about 3
mins. With this we can save almost 2h of cumulative CI time per
pipeline run:

| master   | pull-only |  diff    | container
| 0:02:34  | 0:02:09   | 00:00:25 |  alpha-debian-cross-container
| 0:04:45  | 0:02:40   | 00:02:05 |  amd64-alpine-container
| 0:09:51  | 0:02:56   | 00:06:55 |  amd64-centos8-container
| 0:07:21  | 0:02:49   | 00:04:32 |  amd64-debian-container
| 0:06:00  | 0:02:37   | 00:03:23 |  amd64-debian-cross-container
| 0:14:22  | 0:03:41   | 00:10:41 |  amd64-debian-user-cross-container
| 0:10:14  | 0:03:24   | 00:06:50 |  amd64-fedora-container
| 0:12:09  | 0:02:49   | 00:09:20 |  amd64-opensuse-leap-container
| 0:07:33  | 0:02:45   | 00:04:48 |  amd64-ubuntu2004-container
| 0:08:28  | 0:03:07   | 00:05:21 |  arm64-debian-cross-container
| 0:04:27  | 0:02:58   | 00:01:29 |  armel-debian-cross-container
| 0:08:01  | 0:02:55   | 00:05:06 |  armhf-debian-cross-container
| 0:03:33  | 0:02:18   | 00:01:15 |  cris-fedora-cross-container
| 0:00:28  | 0:00:28   | 00:00:00 |  docker-edk2
| 0:00:25  | 0:00:28   |-00:00:03 |  docker-opensbi
| 0:08:34  | 0:03:10   | 00:05:24 |  hexagon-cross-container
| 0:02:34  | 0:02:08   | 00:00:26 |  hppa-debian-cross-container
| 0:04:50  | 0:02:28   | 00:02:22 |  i386-fedora-cross-container
| 0:02:36  | 0:02:12   | 00:00:24 |  m68k-debian-cross-container
| 0:02:40  | 0:02:09   | 00:00:31 |  mips-debian-cross-container
| 0:02:38  | 0:02:09   | 00:00:29 |  mips64-debian-cross-container
| 0:04:28  | 0:02:48   | 00:01:40 |  mips64el-debian-cross-container
| 0:07:07  | 0:02:46   | 00:04:21 |  mipsel-debian-cross-container
| 0:03:51  | 0:02:21   | 00:01:30 |  powerpc-test-cross-container
| 0:08:52  | 0:03:00   | 00:05:52 |  ppc64el-debian-cross-container
| 0:06:07  | 0:02:49   | 00:03:18 |  python-container
| 0:04:37  | 0:02:26   | 00:02:11 |  riscv64-debian-cross-container
| 0:02:39  | 0:02:08   | 00:00:31 |  riscv64-debian-test-cross-container
| 0:08:03  | 0:03:00   | 00:05:03 |  s390x-debian-cross-container
| 0:02:34  | 0:02:08   | 00:00:26 |  sh4-debian-cross-container
| 0:02:37  | 0:02:09   | 00:00:28 |  sparc64-debian-cross-container
| 0:04:25  | 0:02:17   | 00:02:08 |  tricore-debian-cross-container
| 0:12:51  | 0:03:27   | 00:09:24 |  win32-fedora-cross-container
| 0:11:16  | 0:03:29   | 00:07:47 |  win64-fedora-cross-container
| 0:03:28  | 0:02:20   | 00:01:08 |  xtensa-debian-cross-container
                       | 01:57:30 |

We would need to devise a mechanism (not included here) to force the
re-build of the container images when needed, perhaps an environment
variable or even a whole new "container build" stage before the
"container" stage.

What do you think?

Fabiano Rosas (1):
  gitlab: Use plain docker in container-template.yml

 .gitlab-ci.d/container-template.yml | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

-- 
2.35.3


