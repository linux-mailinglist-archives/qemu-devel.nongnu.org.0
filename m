Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5CE6AE522
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 16:43:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZZSH-00055u-Hn; Tue, 07 Mar 2023 10:42:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZZSF-00051V-7Q
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:42:19 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZZSD-0006Ez-F3
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:42:18 -0500
Received: by mail-wr1-x42a.google.com with SMTP id g3so12566675wri.6
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 07:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678203735;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=74vAKFBA0O9oy4Mbr1O3L34ArgkB/qAg1kxwaQlAB0o=;
 b=Up9JMJ1NuGmbIjWI1PQBgjgpXokR0rQNWdqG3F2EAI4VibGHEhTYtxdPZl/RbsgrTi
 w1rYHbKjWUfm/oObh/Ui6afgDTgXtVf81/tc3FXXqEbmVrW4gUzR72i4FmzHAGULLGyw
 Xp0t1zZMyppOkvEvF6G/AtgKGCSIF3puI1MUheB/pntOlCy576csMbFBBzlueh8pSh13
 /29oCfgZgG9iWgvL3Nzor3xC3kn7UrPkdwiZ9JZxxyzTkfeqS2WgB3H7FMm3ciywrQuL
 NYN4sXvUsN5Dys0Bpu3Jqnr6KCqucgeg7Qs+qBHZfGUnhGEhQeyYNMXPcTyjx+6/OiNH
 v3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678203735;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=74vAKFBA0O9oy4Mbr1O3L34ArgkB/qAg1kxwaQlAB0o=;
 b=IVOsz+Eww/WqOFSMAZpFo7Xr+lmHGHRp8ilZfeplVcfkQpdj6lHLuZc03okmK0iqLT
 gF3rnKH4Ut7/z+6CushO2N0lAsCoItSta7BZ4BFAGSmRY230wcpg6T2xFDEDLLMsbXrG
 kxHq60mJrBcWiW0y2/Q45v761DwFsTJNsNTM7nZ6n+i2vn3tnteWAVNpoKYbPnVW1T5F
 y7WbW+HUXlZWBJ+REkkD3dzZlNkDdikBKfOfms2MPy48B85SS1sE9k9o7R47U5RvEuXy
 IwIKrBGfs8SSNuEZf9FC6RlngP8pmow33mhASLBg5SXFXpqDpIsYjn/wfho8LIfXSdvq
 h8wA==
X-Gm-Message-State: AO0yUKWbYLKjwW0pOcMVa59LX5x5dILlZkVvoUspHt6OBjhia+8eadMG
 vzNTtNsFN9cYw77xxcO5XO0=
X-Google-Smtp-Source: AK7set9rFAxsWGLDG1Yfv4fXzbVeCS62Wf1GNxeR5INVkKZz/43FKNMtK+CS/JeSbo9jp+1Z+0TQnA==
X-Received: by 2002:a5d:4c4c:0:b0:2c5:4f06:5fe with SMTP id
 n12-20020a5d4c4c000000b002c54f0605femr9995845wrt.57.1678203735230; 
 Tue, 07 Mar 2023 07:42:15 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a5d4dc2000000b002be5bdbe40csm12732476wru.27.2023.03.07.07.42.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 07:42:14 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <8afd13b9-78c3-67d6-c1fc-e5a35260e218@xen.org>
Date: Tue, 7 Mar 2023 15:42:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 17/25] hw/xen: Build PV backend drivers for
 CONFIG_XEN_BUS
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-18-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-18-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Now that we have the redirectable Xen backend operations we can build the
> PV backends even without the Xen libraries.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/9pfs/meson.build            | 2 +-
>   hw/block/dataplane/meson.build | 2 +-
>   hw/block/meson.build           | 2 +-
>   hw/char/meson.build            | 2 +-
>   hw/display/meson.build         | 2 +-
>   hw/usb/meson.build             | 2 +-
>   hw/xen/meson.build             | 5 ++++-
>   7 files changed, 10 insertions(+), 7 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


