Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 903926F867E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 18:18:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puy7W-0002hK-EC; Fri, 05 May 2023 12:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1puy7Q-0002g7-FK
 for qemu-devel@nongnu.org; Fri, 05 May 2023 12:17:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1puy7O-0008Rn-Kn
 for qemu-devel@nongnu.org; Fri, 05 May 2023 12:17:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683303432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7wGr64MThf8eyQJ6hvxFtE5QioFd//XUYDgkdlAcvB8=;
 b=bK9okzWhYo3XiZFvkQUVrDSqf2NdVtstVgXB+nbOnlyJ7T3MJwyBMA93/OgWuWIFOdOZYL
 HiQx6XAaP2dk3fXrV7gxas4sQmk9NhBIkQ5DMQbJY1gDoEH1WpgH/uffpHmJzkU2YpQr64
 YFpyncihXHVLmfHWeYwVnHLqo/JW1qU=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-g7govC9vNVGbJDsmxzQ-iQ-1; Fri, 05 May 2023 12:17:11 -0400
X-MC-Unique: g7govC9vNVGbJDsmxzQ-iQ-1
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-331949eb356so12346655ab.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 09:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683303431; x=1685895431;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7wGr64MThf8eyQJ6hvxFtE5QioFd//XUYDgkdlAcvB8=;
 b=fJOK8+7HL1un0AxqymogyEAqvfBv87U6JY0MC+pBMXJ3FpaKqfGjcpkVYiD5BEmIhC
 KpMz0KhrrvnHhK7dKtTtmejh8QxZXSdnhE34hgm4/bz/o3FuYQktObIBOB3rej0kpcFc
 9oLKvKx7tRoS5AeG/wslmsOlaoRc5WF/9fVYCHpG6XxhAkKJCAyXj9ZOVYIEAXE6b4wv
 dOMUFiE3//9y3kAu9IA1lDepBVmuyTBIxhmVsyxMKa7PuVPfnJ9dB0NcKFp58zK/mhIG
 D6vqiJ1kv1klNjyD/U8QwTwmPwOw8t9HZOHkA5PiFdOes6G05txXVTPRuSpcZVGCC1Rx
 rZRw==
X-Gm-Message-State: AC+VfDxPIkuYChI7cbAhGV558i5JwHVESvopb2zx3yIu84WlROubCbMU
 lKexXQewEf16dWhaZkAQoDMrK2DI/ajAxW8bMd4PqBfI09NeUAJcwlg+n0uCemFogfHesjgYFfm
 J7hmWELNYPWyE/as=
X-Received: by 2002:a92:c08b:0:b0:329:5a6e:3a18 with SMTP id
 h11-20020a92c08b000000b003295a6e3a18mr1168458ile.4.1683303430841; 
 Fri, 05 May 2023 09:17:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5P3fZICW/H7ZI6jk+krVPYZW3rGKDqjPiM4OgrXBjyIlB77r7wTQCObHECwSWiwZY3F2YOdA==
X-Received: by 2002:a92:c08b:0:b0:329:5a6e:3a18 with SMTP id
 h11-20020a92c08b000000b003295a6e3a18mr1168442ile.4.1683303430588; 
 Fri, 05 May 2023 09:17:10 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 f11-20020a6b510b000000b0076140f7918dsm30372iob.49.2023.05.05.09.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 09:17:09 -0700 (PDT)
Date: Fri, 5 May 2023 10:17:07 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rkanwal@rivosinc.com,
 anup@brainfault.org, dbarboza@ventanamicro.com, atishp@atishpatra.org,
 vincent.chen@sifive.com, greentime.hu@sifive.com, frank.chang@sifive.com,
 jim.shu@sifive.com, "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Avihai Horon <avihaih@nvidia.com>, Thomas Huth
 <thuth@redhat.com>, kvm@vger.kernel.org
Subject: Re: [PTACH v2 1/6] update-linux-headers: sync-up header with Linux
 for KVM AIA support
Message-ID: <20230505101707.495251a2.alex.williamson@redhat.com>
In-Reply-To: <20230505113946.23433-2-yongxuan.wang@sifive.com>
References: <20230505113946.23433-1-yongxuan.wang@sifive.com>
 <20230505113946.23433-2-yongxuan.wang@sifive.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri,  5 May 2023 11:39:36 +0000
Yong-Xuan Wang <yongxuan.wang@sifive.com> wrote:

> Update the linux headers to get the latest KVM RISC-V headers with AIA support
> by the scripts/update-linux-headers.sh.
> The linux headers is comes from the riscv_aia_v1 branch available at
> https://github.com/avpatel/linux.git. It hasn't merged into the mainline kernel.

Updating linux-headers outside of code accepted to mainline gets a down
vote from me.  This sets a poor precedent and can potentially lead to
complicated compatibility issues.  Thanks,

Alex


