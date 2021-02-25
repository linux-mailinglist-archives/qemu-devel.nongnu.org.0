Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 662AE3258A2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 22:29:17 +0100 (CET)
Received: from localhost ([::1]:60000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFOCC-0001FV-F2
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 16:29:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keescook@chromium.org>)
 id 1lFO8O-00066F-3q
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 16:25:20 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:40226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <keescook@chromium.org>)
 id 1lFO8L-0005JU-G9
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 16:25:19 -0500
Received: by mail-pf1-x42f.google.com with SMTP id d12so1941893pfo.7
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 13:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sv/cK48MuX+Y4npc2hqZNXEhNZvtvJw2LfqK3MM06hw=;
 b=JjVphRv+SRo+9fpJNqL523OmYibey9F250gnNPlbPjXQG+ztlA+oqhkY7O3/iTvwIY
 z7OZeQ60wF/hLu4metB+Oye1wic+BQ5HCq3VDirJcq4GrNDn0wJcnj/w+K3tNd9xXZAq
 ZG1kvBy5UHT+PqZPv4Pts6Sj0ro4boAdeNW+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sv/cK48MuX+Y4npc2hqZNXEhNZvtvJw2LfqK3MM06hw=;
 b=EQ2GKUA1aZGxIcgZy7xMJG6XY4VriKtIMcWP1ImbGBnPsB3inM0FgvchkgoZPTZONp
 gmbVca6wYPouenSgGHWEA0PKnjlylDFA+snBnc4lrnfh3Oy082crPdjCA5/Vai/pS8nP
 RIodh/fVgFK+hdbYtZf1fAXNMtRBLnjjXvhrczFBbKEM+1LwtIc8zTL4wiN+xipzqxEf
 3zD2IoKuDUqlE82SkxdQSVT0ZECjHO7Jky0YhxbLI21IZTWF3MXD+OF55keSc4GP7rfh
 2dNVvXY4OEgzpmZ0d8ilhJo1ti0MFsaSr6WliJMPzidy6m1qfEWvkR5q4kuibLQzF2nd
 rSHQ==
X-Gm-Message-State: AOAM530eNjccfGlN9XKGlec8BPXtFIk+WegFl75bf7S7Pg3EEaPkm9uN
 oYLZxaGv4bIdo8IIJoGUHYGosw==
X-Google-Smtp-Source: ABdhPJwv7cS34Qgav8vXf+fZl/tgCsqDCEsYnjKs8I0rA5qzN143Z9PhcknHelCjyylWDbqA4zAu2w==
X-Received: by 2002:a63:fd0a:: with SMTP id d10mr4584076pgh.405.1614288315130; 
 Thu, 25 Feb 2021 13:25:15 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id w3sm6812240pjt.4.2021.02.25.13.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 13:25:14 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Gabriel Somlo <somlo@cmu.edu>, Nathan Chancellor <nathan@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] qemu_fw_cfg: Make fw_cfg_rev_attr a proper kobj_attribute
Date: Thu, 25 Feb 2021 13:25:04 -0800
Message-Id: <161428829728.2305454.15456455443457551559.b4-ty@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210211194258.4137998-1-nathan@kernel.org>
References: <20210211194258.4137998-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=keescook@chromium.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kees Cook <keescook@chromium.org>,
 Nick Desaulniers <ndesaulniers@google.com>, qemu-devel@nongnu.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Sami Tolvanen <samitolvanen@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Feb 2021 12:42:58 -0700, Nathan Chancellor wrote:
> fw_cfg_showrev() is called by an indirect call in kobj_attr_show(),
> which violates clang's CFI checking because fw_cfg_showrev()'s second
> parameter is 'struct attribute', whereas the ->show() member of 'struct
> kobj_structure' expects the second parameter to be of type 'struct
> kobj_attribute'.
> 
> $ cat /sys/firmware/qemu_fw_cfg/rev
> 3
> 
> [...]

Applied to kspp/cfi/cleanups, thanks!

[1/1] qemu_fw_cfg: Make fw_cfg_rev_attr a proper kobj_attribute
      https://git.kernel.org/kees/c/f5c4679d6c49

-- 
Kees Cook


