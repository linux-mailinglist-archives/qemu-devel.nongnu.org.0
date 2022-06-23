Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA813558B0D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 00:03:28 +0200 (CEST)
Received: from localhost ([::1]:55754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Uv8-0001mw-LN
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 18:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4UYV-000166-VM
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 17:40:05 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:46077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4UYI-0007AM-5J
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 17:40:03 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 t3-20020a17090a510300b001ea87ef9a3dso867759pjh.4
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 14:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Auqz1lDCiLkEN2MLKwkD4LM6KOVrG8WrAxUY62LmqNw=;
 b=tEdieR7oFROlSxBdRDokXUiPQf+leE6l6VSNQWlXrXEGM7wDoznJRmwwuKIvQ5DROh
 /J1WO3dPwYFQlwr9ePXCLerlIYRwC6iQTkFqZWxZnn6OagPYVZOvFVC86DpUctk14m53
 1UJgCq1ZSP2b6LjNPKJMusXKl7yAsOLNXQz7O3INU1+F1ZPDiBhUQUBftdF/q68sqbN/
 V03xlxttdHIt1C8ebdxINNFuGiCFBbsTkgc/m/wK5NOwu8UI+dwdT5/8Qe4N0HzIRr/7
 a5Aqph3j737/63slDuT6SvawKRd07gU08m8+/ycjaCEWB7C1LBQOWuxn+6antJs179S0
 dRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Auqz1lDCiLkEN2MLKwkD4LM6KOVrG8WrAxUY62LmqNw=;
 b=v0UAb2UAcoBjZcNjmvV6s0KOgWerqBuipf/t/d63qVmDdBU9rZgW0Sumv/f8lwdf8z
 uyKw6xqmjHRCL07yKqPiHnrvX8mKHUEV6qjR78YYvyUtG/UpWPtsxjz3L+mmQFRp0/Bd
 5q8+k+YZgD+TwUt9EAb/Op6XVQnpOwqV44dnWYyd2oO+mVWWUPm67Rttnw+/K31f8s/F
 6RxDYs8WjOt0jwWUkZH8GHysnanGE+X1uaq4t5Mx38QTgW+4DlMuR6HGSHWwCkJDXQTF
 GW0qeGyLkj5MTVOI55lw4iMpdOX1M55b9FvBlvce1L0ASq3/hqY6CkyeCErHGzkfY5GU
 7vWQ==
X-Gm-Message-State: AJIora/K/VeQvddCVAf8y2xOyh6H0EKKHibtDfzwi3UZUyly6YGFgKE5
 H8oCFlVUAW0IyCqGkScDP0CTtg==
X-Google-Smtp-Source: AGRyM1un52wTaDkSYRDIznG60nKVbJUiXQaEzhQFedX34e+ljXremGzgeplIbH8rt2qRvS7akP+oyQ==
X-Received: by 2002:a17:903:1c6:b0:16a:6941:10e8 with SMTP id
 e6-20020a17090301c600b0016a694110e8mr45418plh.158.1656020384979; 
 Thu, 23 Jun 2022 14:39:44 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:279f:82a0:a006:5ea8?
 ([2602:ae:1543:f001:279f:82a0:a006:5ea8])
 by smtp.gmail.com with ESMTPSA id
 d63-20020a621d42000000b0052532d9cb18sm102200pfd.183.2022.06.23.14.39.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 14:39:40 -0700 (PDT)
Message-ID: <129c9f52-d615-491b-fed4-c401a0fc3f6b@linaro.org>
Date: Thu, 23 Jun 2022 14:37:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/25] migration queue
Content-Language: en-US
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, berrange@redhat.com, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com, peterx@redhat.com
Cc: jdenemar@redhat.com
References: <20220623165354.197792-1-dgilbert@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220623165354.197792-1-dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 6/23/22 09:53, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> The following changes since commit 2b049d2c8dc01de750410f8f1a4eac498c04c723:
> 
>    Merge tag 'pull-aspeed-20220622' of https://github.com/legoater/qemu into staging (2022-06-22 07:27:06 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220623b
> 
> for you to fetch changes up to 77ef2dc1c8c6a482fd06fdf3b59d0647f0850e3e:
> 
>    migration: remove the QEMUFileOps abstraction (2022-06-23 10:18:13 +0100)
> 
> ----------------------------------------------------------------
> [v3] Migration pull 2022-06-23
> 
> This replaces my and Juan's earlier pulls over the last 2 days;
> 4th time lucky?
> 
> Compared to my pull earlier:
>    Removed Hyman's dirty ring set
> 
> In this migration PULL request:
> - Dainiel Berrangé - qemufileops cleanup
> - Leonardo Bras  - cleanups for zero copy
> - Juan Quintela  - RDMA cleanups

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> ----------------------------------------------------------------
> Daniel P. Berrangé (21):
>        io: add a QIOChannelNull equivalent to /dev/null
>        migration: switch to use QIOChannelNull for dummy channel
>        migration: remove unreachble RDMA code in save_hook impl
>        migration: rename rate limiting fields in QEMUFile
>        migration: rename 'pos' field in QEMUFile to 'bytes_processed'
>        migration: rename qemu_ftell to qemu_file_total_transferred
>        migration: rename qemu_update_position to qemu_file_credit_transfer
>        migration: rename qemu_file_update_transfer to qemu_file_acct_rate_limit
>        migration: introduce a QIOChannel impl for BlockDriverState VMState
>        migration: convert savevm to use QIOChannelBlock for VMState
>        migration: stop passing 'opaque' parameter to QEMUFile hooks
>        migration: hardcode assumption that QEMUFile is backed with QIOChannel
>        migration: introduce new constructors for QEMUFile
>        migration: remove unused QEMUFileGetFD typedef / qemu_get_fd method
>        migration: remove the QEMUFileOps 'shut_down' callback
>        migration: remove the QEMUFileOps 'set_blocking' callback
>        migration: remove the QEMUFileOps 'close' callback
>        migration: remove the QEMUFileOps 'get_buffer' callback
>        migration: remove the QEMUFileOps 'writev_buffer' callback
>        migration: remove the QEMUFileOps 'get_return_path' callback
>        migration: remove the QEMUFileOps abstraction
> 
> Juan Quintela (1):
>        migration: Remove RDMA_UNREGISTRATION_EXAMPLE
> 
> Leonardo Bras (3):
>        QIOChannelSocket: Introduce assert and reduce ifdefs to improve readability
>        QIOChannelSocket: Fix zero-copy send so socket flush works
>        migration: Change zero_copy_send from migration parameter to migration capability
> 
>   include/io/channel-null.h         |  55 +++++++++
>   io/channel-null.c                 | 237 ++++++++++++++++++++++++++++++++++++++
>   io/channel-socket.c               |  19 ++-
>   io/meson.build                    |   1 +
>   io/trace-events                   |   3 +
>   migration/block.c                 |  10 +-
>   migration/channel-block.c         | 195 +++++++++++++++++++++++++++++++
>   migration/channel-block.h         |  59 ++++++++++
>   migration/channel.c               |   4 +-
>   migration/colo.c                  |   5 +-
>   migration/meson.build             |   2 +-
>   migration/migration.c             |  68 +++++------
>   migration/multifd.c               |   4 +-
>   migration/qemu-file-channel.c     | 194 -------------------------------
>   migration/qemu-file-channel.h     |  32 -----
>   migration/qemu-file.c             | 193 ++++++++++++++++++-------------
>   migration/qemu-file.h             | 125 +++++++++-----------
>   migration/ram.c                   |   8 +-
>   migration/rdma.c                  | 185 ++++++-----------------------
>   migration/savevm.c                |  55 ++-------
>   migration/vmstate.c               |   5 +-
>   monitor/hmp-cmds.c                |   6 -
>   qapi/migration.json               |  33 ++----
>   tests/unit/meson.build            |   1 +
>   tests/unit/test-io-channel-null.c |  95 +++++++++++++++
>   tests/unit/test-vmstate.c         |   5 +-
>   26 files changed, 928 insertions(+), 671 deletions(-)
>   create mode 100644 include/io/channel-null.h
>   create mode 100644 io/channel-null.c
>   create mode 100644 migration/channel-block.c
>   create mode 100644 migration/channel-block.h
>   delete mode 100644 migration/qemu-file-channel.c
>   delete mode 100644 migration/qemu-file-channel.h
>   create mode 100644 tests/unit/test-io-channel-null.c
> 
> 


