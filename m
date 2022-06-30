Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B176560E63
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 02:57:28 +0200 (CEST)
Received: from localhost ([::1]:38994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6iUp-00006f-HL
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 20:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o6iRX-0005rP-Nd
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 20:54:03 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:39457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o6iRT-0004yR-LH
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 20:54:03 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 b12-20020a17090a6acc00b001ec2b181c98so1153130pjm.4
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 17:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qMOriSTaynWQiblyEPkNE9YvXLAPw+pBFUHpqKBlq0c=;
 b=iD/9VmWS6+aEyMP8A+tUv5zk+priaiaDSf5k6zyhf0qoAeNfQcvpYbrbKGDD4cTu3+
 DMnDZDU5Zv3NUtEUQLz61zyejmXnjE11JT6NaChyj2F6MtGj/7EtNj5k+cU70fc77Ohg
 WJloGwpjreSeIlaJexvnTkpxrTzFd7ILgk2eYgj7T6Qbhm5pDqyFRmguLqtlvr2zSE5P
 XpeHTTnWF2G/sKNVh/4YBPbOr4Gd97o65Mo2yTtbUJTFFxBvq/eaEWAiaNRuy/fURY0Y
 eMht3J5N3r99GvZaGGsFkPxZ1bW5eWj7stGv3f57n/W4XcWrGwIBtsNOiJcyl8KewEqL
 u1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qMOriSTaynWQiblyEPkNE9YvXLAPw+pBFUHpqKBlq0c=;
 b=z9nxt7WTcx/UjOxiiTIGEHHDUMHQkDlwkxcFku7xz9hGMGS8AjaKI0k3o/yvUwF5+t
 Xuw0qX5reiQ9NmTRDqtFmEvY5167s4DQCobLLXMiYssAogvKPc3SSRh62E89LuCoXgKP
 9JHSaG8WLYvg1QC7ay5JlN0+LlmMiH+OLw52GWx/vcTcYzkd3LynHbE34bBxjtL56F4Y
 F9d1bKZ0+uOaZEW2Rv+oKrDjA2TZoJrz8NBPcXSH+vP2haZRLFutBKTw3H8Hux4KfCHL
 mf7jHuNqQ+ToIYkEYBfP7wSc1eIjExQ0i5SjVESLyf2CcKf8Ui0gpHQBYizqn/dtetUS
 y7oA==
X-Gm-Message-State: AJIora81bJOlkQAkR5igACJuG1rB5cr18yGm2LoT9xNFSP4viWG2v0xG
 v8nGv7GuuHeownP7CsS9zmY3mA==
X-Google-Smtp-Source: AGRyM1t+lhyikNCH0pMoSbw1YVD7Up2dfPKZUf+GYXZ4ud+hyEcjWX1aN8HeJmAsGcTgbTD5RXVNWw==
X-Received: by 2002:a17:90a:f684:b0:1ec:b252:4cd2 with SMTP id
 cl4-20020a17090af68400b001ecb2524cd2mr6825720pjb.196.1656550433030; 
 Wed, 29 Jun 2022 17:53:53 -0700 (PDT)
Received: from [192.168.123.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 a134-20020a621a8c000000b00527f2e72437sm2218772pfa.132.2022.06.29.17.53.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 17:53:52 -0700 (PDT)
Message-ID: <de05199e-6168-375e-ca83-692daae58bb2@linaro.org>
Date: Thu, 30 Jun 2022 06:23:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/11] Trivial branch for 7.1 patches
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20220629090849.1350227-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220629090849.1350227-1-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/29/22 14:38, Laurent Vivier wrote:
> The following changes since commit ad4c7f529a279685da84297773b4ec8080153c2d:
> 
>    Merge tag 'pull-semi-20220628' of https://gitlab.com/rth7680/qemu into staging (2022-06-28 10:24:31 +0530)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.1-pull-request
> 
> for you to fetch changes up to c379bd7551f34e42c4c935783c0c08bab41d70c1:
> 
>    hw/i386/xen/xen-hvm: Inline xen_piix_pci_write_config_client() and remove it (2022-06-29 00:24:59 +0200)
> 
> ----------------------------------------------------------------
> trivial patches pull request 20220629

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Bernhard Beschow (3):
>    hw/pci-host/i440fx: Remove unused parameter from i440fx_init()
>    hw/i386/xen/xen-hvm: Allow for stubbing xen_set_pci_link_route()
>    hw/i386/xen/xen-hvm: Inline xen_piix_pci_write_config_client() and
>      remove it
> 
> Dr. David Alan Gilbert (2):
>    Trivial: 3 char repeat typos
>    trivial typos: namesapce
> 
> Eugenio Pérez (1):
>    util: Return void on iova_tree_remove
> 
> Guo Zhi (1):
>    vga: avoid crash if no default vga card
> 
> Lev Kujawski (1):
>    hw/ide/atapi.c: Correct typos (CD-CDROM -> CD-ROM)
> 
> Markus Armbruster (1):
>    MAINTAINERS: Add softmmu/runstate.c to "Main loop"
> 
> Philippe Mathieu-Daudé (1):
>    qom/object: Remove circular include dependency
> 
> Thomas Huth (1):
>    common-user: Only compile the common user code if have_user is set
> 
>   MAINTAINERS                      |  1 +
>   common-user/meson.build          |  4 ++++
>   hw/9pfs/9p-xattr-user.c          |  8 ++++----
>   hw/acpi/nvdimm.c                 |  2 +-
>   hw/i386/pc_piix.c                |  3 ---
>   hw/i386/xen/xen-hvm.c            | 17 ++---------------
>   hw/ide/atapi.c                   |  4 ++--
>   hw/intc/openpic.c                |  2 +-
>   hw/isa/piix3.c                   | 15 ++++++++++++++-
>   hw/net/imx_fec.c                 |  2 +-
>   hw/nvme/ctrl.c                   |  2 +-
>   hw/pci-host/i440fx.c             |  4 +---
>   hw/pci/pcie_aer.c                |  2 +-
>   hw/pci/shpc.c                    |  3 ++-
>   hw/ppc/spapr_caps.c              |  2 +-
>   hw/scsi/spapr_vscsi.c            |  2 +-
>   include/hw/pci-host/i440fx.h     |  1 -
>   include/hw/xen/xen.h             |  2 +-
>   include/hw/xen/xen_common.h      |  6 ------
>   include/qemu/iova-tree.h         |  4 +---
>   include/qom/object.h             |  1 -
>   qapi/net.json                    |  2 +-
>   softmmu/vl.c                     |  3 ++-
>   stubs/xen-hw-stub.c              |  3 ++-
>   tools/virtiofsd/passthrough_ll.c |  2 +-
>   ui/input.c                       |  2 +-
>   util/iova-tree.c                 |  4 +---
>   27 files changed, 47 insertions(+), 56 deletions(-)
> 


