Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBEB6626A5
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 14:15:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pErXE-0004AI-5E; Mon, 09 Jan 2023 07:45:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhiyong@bytedance.com>)
 id 1pErX1-00048i-HA
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:45:41 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yezhiyong@bytedance.com>)
 id 1pErWy-0005Dd-NJ
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:45:38 -0500
Received: by mail-pl1-x62e.google.com with SMTP id w3so9388279ply.3
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:subject:from:cc:to:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=UNyhFeanROxpfDshtZYAnHS8qmSwjG071nqJxqah6KA=;
 b=HCuNkT1prA+bJiRag4YRM5b1GJh3Fp7bleYigNaE3zhbRcEKqZ9v0jlDp4v/tgeRi3
 tvHPbRfTDxc14kAZ7jl5Ab9eStSWvK4Q5R6rGqUdlyz+dATCRszpI4dvLl0Yx3exJkMf
 zacu5niHS4FzVdhsRXa7+x1dY/uBgyPttXCGHGVLcnagpOA/S0bmZFGisqKc1ok43bdy
 2aEncwc9gNKzf0scGITKIO7zdCpv54WRTjtLrfSfs1Od1J5h/pew5vTtIdEPqgWmJa7k
 ZMY9akdzHWHORLrTJlP38NrJ2wgng0leIfKrY6QM7zXwV+z26cGlj0yBtUoagOzpYHHZ
 1uNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:cc:to:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=UNyhFeanROxpfDshtZYAnHS8qmSwjG071nqJxqah6KA=;
 b=adnZsFc9BeMQNWuJrMTFwCifFG+7lr+GbmV9Yi2agMjp7d7IskRtXNoY+/brU6F/3l
 j2pgfQ3CdZYZ5s6a8XSPJ2psmr6S/6RrqxBEzwRdnBq0f4fOJMxkTeJ2oOXKWM8I/tvj
 P0xOfilsUvBIvkaKXMsqRc7PSZtLMoe5iBgvZ4gg/qoQQpYQza5hjWqPbLPVOXoRoZV+
 gE6KXdThNPplnqMSX4RjDh1F/Zv9zSnWrLM/XnMcfRTh9DzbuOG8fp+J0lPFU+t3G7oQ
 1xRYAz3+OaIx4sbzV8uxk57bAdRXadmrckmgRGQNpw2SFj3YrrzvWvBTUCRyimp8V0LI
 sl1Q==
X-Gm-Message-State: AFqh2koInoe4sMyfWNV5aCFqa4M4wdgPdmVMiZb48zOomANVK8cHs6LB
 /5N7adHQBFmJ5T4y6OY265/bCg==
X-Google-Smtp-Source: AMrXdXvngqbf7gY9+kyWhI8TGk1BKuE5dCKq4peO3FBFaSoFh9Tl02NeQNGWjSwE3VPSsPjIH94awQ==
X-Received: by 2002:a17:902:9008:b0:189:ed86:178b with SMTP id
 a8-20020a170902900800b00189ed86178bmr72790941plp.64.1673268331482; 
 Mon, 09 Jan 2023 04:45:31 -0800 (PST)
Received: from [10.87.56.20] ([139.177.225.237])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a1709026e0800b001928c9d772bsm5361264plk.206.2023.01.09.04.45.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 04:45:31 -0800 (PST)
Message-ID: <90855f8f-76ce-0a5f-3156-e69b157342c9@bytedance.com>
Date: Mon, 9 Jan 2023 20:45:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Kevin Wolf <kwolf@redhat.com>, mreitz@redhat.com, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org
From: Zhiyong Ye <yezhiyong@bytedance.com>
Subject: Questions about how block devices use snapshots
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=yezhiyong@bytedance.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Dear all,

Qemu provides powerful snapshot capabilities for different file formats. 
But this is limited to the block backend being a file, and support is 
not good enough when it is a block device. When creating snapshots based 
on files, there is no need to specify the size of the snapshot image, 
which can grow dynamically as the virtual machine is used. But block 
devices are fixed in size at creation and cannot be dynamically grown at 
a later time.

So is there any way to support snapshots when the block backend is a 
block device?

Regards

Zhiyong

