Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBAE36EC35
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 16:15:41 +0200 (CEST)
Received: from localhost ([::1]:54294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc7S8-00071m-DT
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 10:15:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lc7QB-0005Nt-EU
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:13:39 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:36281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lc7Q8-0004PQ-C6
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:13:39 -0400
Received: from quad ([82.142.25.254]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N6sSV-1lWCzn11Sx-018JJe; Thu, 29
 Apr 2021 16:13:28 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] hw/elf_ops: clear uninitialized segment space
Date: Thu, 29 Apr 2021 16:13:23 +0200
Message-Id: <20210429141326.69245-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oWAWbMUDLI2eUon2cega4kD8x6dBBM+XAr/0La5hB3KkMNtMBgg
 V/ba7Lq7Tv2rt6LRA57TxCo6r40vW/KqsV8zfgDMqYPYiXfCbVjzq0J66a076IHg0UKlj/S
 jPpTM5xv0jJA4evrswwDyNLZ/EuW+nj41+ipYAkxWtfuxhagwG5T522ayvdBz2JVj8DWFbD
 W/wGl4NvXgpvrSg884zKw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qRSm054BG5Y=:/wBUKS18nECMPluf33xkuy
 G1I/oiO6gM42HxtnSvpfIEOJoPEtpNjzEbELs9m6troJ8AObuGFKkb2AsYxUuWBWo7/Nfw1bV
 l0IRLcJvCg3Jz/2E7vEqFWrF1igl3vl1ygSpYw8IunTW4x+WVZyqk4KaUVcMy7rawEbY0OUql
 uGN0l0u7HMWGDKlfLgKGuMTGvDN5xg3KGqrhyG2HYrxMxffVmYT7O/AjHREjzl9fmnlBLBA95
 kgyxDHReAiYgyttjKgjqrGtJls5LYeBN/Hbnv/0jdb8uoYSE5FLcBEdHA0NZjvTiIzyIKz976
 j/juNVyjsCCETdDW94l0rtSCiP0dlmsEhQeEoHf7MUyEIxet+RW4lAOF3GeaHWaVTZFjNh9hb
 yl0a+2DwjKsGHZKhDnmslNHo8DIqfPkeEErgy+Qy64QHDhRvsDuny8RI4ghSvao9UMzMw6BGz
 /gs5V70jcWlOCq+wvHLDjfGeClwjtETYGNJtpdbOSF555LkP2b1JG30s7L6QUjZQIK80rd1yf
 qJSdEQ9R4a4sq5BTEjOycs=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the mem_size of the segment is bigger than the file_size,=0D
and if this space doesn't overlap another segment, it needs=0D
to be cleared.=0D
=0D
When the file is loaded in RAM, it is cleared by the loader (PATCH 2),=0D
when the file is loaded in a ROM, the space is cleared on reset,=0D
when the data of the file is copied from the data buffer to=0D
the machine memory space (PATCH 3).=0D
=0D
This series a new function address_space_set() to clear the memory.=0D
=0D
v3: add a patch to clear the uninitialized space of the ROM=0D
v2: PMD introduces address_space_set() function=0D
=0D
Laurent Vivier (2):=0D
  hw/elf_ops: clear uninitialized segment space=0D
  hw/core/loader: clear uninitialized ROM space=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  exec/memory: Extract address_space_set() from dma_memory_set()=0D
=0D
 include/exec/memory.h | 16 ++++++++++++++++=0D
 include/hw/elf_ops.h  | 13 +++++++++++++=0D
 hw/core/loader.c      |  4 ++++=0D
 softmmu/dma-helpers.c | 16 +---------------=0D
 softmmu/physmem.c     | 19 +++++++++++++++++++=0D
 5 files changed, 53 insertions(+), 15 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

