Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDA050F2F5
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 09:48:46 +0200 (CEST)
Received: from localhost ([::1]:49316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njFwD-0004BE-BW
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 03:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njFth-0003N9-KS
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 03:46:10 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njFtd-0006Ni-EB
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 03:46:09 -0400
Received: by mail-wr1-x430.google.com with SMTP id q23so11287829wra.1
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 00:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=F7uBz1WzndkPeuLtiMO7CNHxITaZTbymj/4i0ZBWjCV4v7++J4pb2aljXjWrxRObtr
 5/Dni4Bh148DipApOZcVtRVm0QmIsyGcj1hWr8hNc7t9WvgcPESgE6GUywLobTklmnNS
 6eS7xsu3TNcODcfz/k5YtSjzWKEnWTXjlf6vzhqD2PWoQ0HlFm4gRzqDfHFFeKjLxzV4
 DisEY6wGQ68qdr4XUNyIc3zeaGQdmYKv21v8LUoMKbhZmD5QsHqp92VssJ6dpGAGnQjU
 KKye6/t3mIENp/5cGG5mkF5lzHM1XuQx8IREesI+qgUGTKiYG2GeO9Qz+EyR45TScSDb
 GljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=FAIixpSJyopY0cmnYzsjtTvUQVw7ZXkJXVz5auR4FbHZeqgdmWjjBAXDtlCoxO45rp
 IQmKmJGOIK9W/8tm5IG444AJEPSYqrM+7M5yvxwdZr6n5COLVSykc6mzXWwLLdUVtZXn
 aPLmZPIM8pvLQi3E+/TDtG3PCU9YQM+edJgK364sIch+TqZx56O38t9uRjtyKkcZsz47
 WVDiKfP10DO92gyP6y++VVhYduqYfOQTaXXAKEA1EiIcjlST5uBV260Dr2+8kgHvDbCs
 9hTjQMLHmUOtrk9BW24mk85hMQd6sZFILfdf8t3jlzMDmY3+f9pHI9SjeyqaGQdQsZxi
 kJRg==
X-Gm-Message-State: AOAM533ubAyU9b0gxKQ/5lHSUiwRnuTx/SqqvCl53BM+fz8QbcVZXoPf
 BebMR8GvbPJxpo3uPkzhMAQ=
X-Google-Smtp-Source: ABdhPJwcSy64dlPXHRByb0R2I0jUb9qdF1B/nTBZ713ynj1qbTNY42stU8RBseNZ4/b41Bh+etuggQ==
X-Received: by 2002:a5d:4e05:0:b0:20a:d4a6:32b1 with SMTP id
 p5-20020a5d4e05000000b0020ad4a632b1mr10958868wrt.174.1650959163371; 
 Tue, 26 Apr 2022 00:46:03 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a1c7909000000b0038eb8171fa5sm10402391wme.1.2022.04.26.00.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 00:46:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Haiyue Wang <haiyue.wang@intel.com>
Subject: Re: [PATCH v2] error-report: fix g_date_time_format assertion
Date: Tue, 26 Apr 2022 09:46:01 +0200
Message-Id: <20220426074601.20797-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424105036.291370-1-haiyue.wang@intel.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued, thanks.

Paolo



