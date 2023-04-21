Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 835896EA0D7
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 03:14:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppfKN-0002c8-AH; Thu, 20 Apr 2023 21:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1ppfKK-0002bA-9O
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 21:12:40 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1ppfKA-0008KS-9E
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 21:12:39 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-524b02cc166so898095a12.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 18:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682039547; x=1684631547;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=66T6IkDCXTKMCU19HS077We1ZzJOoGsgYj56IyaO7XI=;
 b=S6g/lq8XNfdLuiXOJvcm2zxRslL86hbwz0HYxednZTRuTtLvq28WoH1PuMCgQ/S1ik
 WmQ1G1zhC+sxhnYAKyTHhPO/BwtgZljPLQVJN8sXwQElgkUweD7jhwvVe7dLwKnWtXfx
 RbM4KoVFOwF6lpa+W498JHoGY/oH4iIS3mz40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682039547; x=1684631547;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=66T6IkDCXTKMCU19HS077We1ZzJOoGsgYj56IyaO7XI=;
 b=jWUz2Sw8TnK9U/EJRqUT7jDYjQE8YCQaKpbixgNTs3/2jC1HiiespKA4ugKj4Mu2PK
 sdXanwimRLN87gy/L0VJf+kibf4qKir9RtyEj/yo8Rc4dYKbd2NUKlg1gPqzEOTixOPk
 vuMFV0sHZGFxmczF0FhF+/AE11ayA2aNB49XyprPy3Vu9Kgh7OOa4+qP27zsYlXrpe5E
 4HDfVRiMVigVga/qvUOiVboE4SjJh/uG+DP0CQIrAe1I8Nyz79Gd5c+aEGs5+52LhChg
 DqqbSfqS2/UXmaox0f95euDFcYDqT4EDuQaqO3+Xw0h17YF3mCEy/dscHnvc2sfZz916
 1thw==
X-Gm-Message-State: AAQBX9f5H6cgNnvtH2d7LNmXumKGuh2TSebsoYuNi1k0egTRL3fG6DL4
 kVDxnw61oT9LX3OGE5qx8jSEmcLO4SEmcL4sT3wjS8Bf
X-Google-Smtp-Source: AKy350Y1Jp7cvjk4Mpr6jNO4KaxWEIQJZBW8cTgXUwk036F/IAhCjOjtEXf/2pPUWgsrCxuk7v0P8w==
X-Received: by 2002:a17:90a:e584:b0:246:b6f9:148a with SMTP id
 g4-20020a17090ae58400b00246b6f9148amr3463397pjz.21.1682039547222; 
 Thu, 20 Apr 2023 18:12:27 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:6625:6aa3:1b0e:a808])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a17090a8e8400b0024702e7c80fsm1697640pjo.23.2023.04.20.18.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 18:12:26 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, philmd@linaro.org, david@redhat.com,
 stefanha@redhat.com, kraxel@redhat.com, marcandre.lureau@redhat.com,
 akihiko.odaki@gmail.com, dmitry.osipenko@collabora.com, ray.huang@amd.com,
 alex.bennee@linaro.org
Subject: [RFC PATCH 00/13] gfxstream + rutabaga_gfx: a surprising delight or
 startling epiphany?
Date: Thu, 20 Apr 2023 18:12:10 -0700
Message-Id: <20230421011223.718-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=gurchetansingh@chromium.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Gurchetan Singh <gurchetansingh@google.com>

Rationale:

- gfxstream [a] is good for the Android Emulator/upstream QEMU
  alignment
- Wayland passhthrough [b] via the cross-domain context type is good
  for Linux on Linux display virtualization
- rutabaga_gfx [c] sits on top of gfxstream, cross-domain and even
  virglrenderer
- This series ports rutabaga_gfx to QEMU

Feedback requested:

- How is everyone feeling about gfxstream/rutabaga_gfx, especially UI
  maintainers?  I've been assuming it is a definite win, so if there's
  a divergence of opinion on that, we should resolve that quickly.

- Need help from memory region API experts on "HACK: use memory region
  API to inject memory to guest"

- Need help from QEMU multi-threaded experts on "HACK: schedule fence
  return on main AIO context"

----------
| Longer |
----------

Dear all,

The people have demanded it, and we have listened.  Just the other
day, some kids came up to me on the street -- hat in hand, teardrops
in their eyes -- and asked "please sir, can you perchance port
gfxstream and rutabaga_gfx to upstream QEMU?".  I honestly can't take
it anymore.

In a way, I can understand the fanaticism of the gfxstreamists -- the
benefits of gfxstream + rutabaga_gfx in upstream QEMU are massive for
all involved:

(i) Android Emulator aligned with QEMU

The biggest use case is no doubt the Android Emulator.  Although used
by millions of developers around the world [d][e], the Android Emulator
itself uses currently uses a forked QEMU 2.12.  The initial fork
happened in the early days of Android (circa 2006 [f]) and while the
situation has improved, a QEMU update inside the Android Emulator only
happens once every 3-5 years. Indeed, most Android Emulator developers
aren't even subscribed to qemu-devel@ given this situation.  Their
task is often to get the next foldable config working or fix that UI
bug, but long term technical debt is something that is rarely
prioritized.

This one of those years when QEMU will be upreved, though.  Soon, the
emulator will be based on QEMU7.2 and new controls will be instituted
to make QEMU modifications harder.  Things that can be upstreamed
will be upstreamed.

One of the biggest downstream pieces of the Android Emulator is the
gfxstream graphics stack, and it has some nontrivial features that
aren't easy to implement elsewhere [g].

The lore of gfxstream is detailed in patch 10, but suffice to say
getting gfxstream mainlined would help move the Android Emulator out
of it's downstream mud hut into the light, love and compassion of
upstream.

(ii) Wayland passthrough

For the Linux guest on Linux host use case, we've elected to port
rutabaga_gfx into QEMU rather than gfxstream.  rutabaga_gfx sits on
top of gfxstream, virglrenderer, and the cross-domain context type.
With the cross-domain context type, one can avoid a guest compositor
pass to display VM windows like host normal windows.  It's now
possible to run the examples found in the crosvm book [h] with this
patchset.  There are a few problems [i], but fixing them is O(days).

This use case is less strong than the Android Emulator one, since
anyone who would play a game in a Linux guest via QEMU would be able
to run it natively.  But it could be good for developers who need to
test code in a virtual machine.

------------------
| Issues         |
------------------

The two biggest unsolved issues are the last two "HACK:" patches.
Feedback from QEMU memory management and threading experts would be
greatly appreciated.

------------------
| UI integration |
------------------

This patchset intentionally uses the simplest KMS display integration
possible: framebuffer copies to Pixman.  The reason is Linux guests
are expected to use Wayland Passthrough, and the Android Emulator UI
integration is very complex.  gfxstream doesn't have a "context 0"
like virglrenderer that can force synchronization between QEMU's and
gfxstream's GL code.

Initially, we just want to run the Android Emulator in headless mode,
and we have a few subsequent followup ideas in mind for UI integration
(all of with the goal to be minimally invasive for QEMU).  Note: even
with Android in headless mode, QEMU upstream will be used in production
and not just be a developer toy.

--------------------------
| Packaging / Versioning |
--------------------------

We have to build QEMU from sources due to compliance reasons, so we
haven't created Debian packages for either gfxstream or rutabaga_gfx
yet.  QEMU is upstream of Debian/Portage anyways.  Let us know the
standard on packaging and we should be able to follow it.

Versioning would be keyed on initial merge into QEMU.

--------------------------
| Testing                |
--------------------------

A document on how to test the patchset is availble on QEMU Gitlab [j].

[a] https://android.googlesource.com/device/generic/vulkan-cereal/
[b] https://www.youtube.com/watch?v=OZJiHMtIQ2M
[c] https://github.com/google/crosvm/blob/main/rutabaga_gfx/ffi/src/include/rutabaga_gfx_ffi.h
[d] https://www.youtube.com/watch?v=LgRRmgfrFQM
[e] https://maltewolfcastle.medium.com/how-to-setup-an-automotive-android-emulator-f287a4061b19
[f] https://groups.google.com/g/android-emulator-dev/c/dltBnUW_HzU
[g] https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg04271.html
[h] https://crosvm.dev/book/devices/wayland.html
[i] https://github.com/talex5/wayland-proxy-virtwl/blob/master/virtio-spec.md#problem
[j] https://gitlab.com/qemu-project/qemu/-/issues/1611

Antonio Caggiano (2):
  virtio-gpu blob prep: improve decoding and add memory region
  virtio-gpu: CONTEXT_INIT feature

Dr. David Alan Gilbert (1):
  virtio: Add shared memory capability

Gerd Hoffmann (1):
  virtio-gpu: hostmem

Gurchetan Singh (9):
  gfxstream + rutabaga prep: virtio_gpu_gl -> virtio_gpu_virgl
  gfxstream + rutabaga prep: make GL device more library agnostic
  gfxstream + rutabaga prep: define callbacks in realize function
  gfxstream + rutabaga prep: added need defintions, fields, and options
  gfxstream + rutabaga: add required meson changes
  gfxstream + rutabaga: add initial support for gfxstream
  gfxstream + rutabaga: enable rutabaga
  HACK: use memory region API to inject memory to guest
  HACK: schedule fence return on main AIO context

 hw/display/meson.build                 |   40 +-
 hw/display/virtio-gpu-base.c           |    6 +-
 hw/display/virtio-gpu-gl.c             |  121 +--
 hw/display/virtio-gpu-pci.c            |   14 +
 hw/display/virtio-gpu-rutabaga-stubs.c |    8 +
 hw/display/virtio-gpu-rutabaga.c       | 1032 ++++++++++++++++++++++++
 hw/display/virtio-gpu-virgl-stubs.c    |    8 +
 hw/display/virtio-gpu-virgl.c          |  138 +++-
 hw/display/virtio-gpu.c                |   17 +-
 hw/display/virtio-vga.c                |   33 +-
 hw/virtio/virtio-pci.c                 |   18 +
 include/hw/virtio/virtio-gpu-bswap.h   |   18 +
 include/hw/virtio/virtio-gpu.h         |   38 +-
 include/hw/virtio/virtio-pci.h         |    4 +
 meson.build                            |    8 +
 meson_options.txt                      |    2 +
 scripts/meson-buildoptions.sh          |    3 +
 17 files changed, 1356 insertions(+), 152 deletions(-)
 create mode 100644 hw/display/virtio-gpu-rutabaga-stubs.c
 create mode 100644 hw/display/virtio-gpu-rutabaga.c
 create mode 100644 hw/display/virtio-gpu-virgl-stubs.c

-- 
2.40.0.634.g4ca3ef3211-goog


