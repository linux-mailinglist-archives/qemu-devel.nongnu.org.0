Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7F56C4C98
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 14:58:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peyy2-0000ye-5G; Wed, 22 Mar 2023 09:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peyy0-0000yJ-FX
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 09:57:28 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peyxy-00016P-GI
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 09:57:28 -0400
Received: by mail-wr1-x434.google.com with SMTP id y14so17184159wrq.4
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 06:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679493444;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WUcZYkCfek8U5HTQqE0ZRnri9xU+leU8uMo6zS0IeAM=;
 b=I0fgFMmUCt8vwS+zyVM/+i25AD79bsrWXAZRcOs/YEEUJ+/mtD3DHPhfX6xqzl+FvH
 bJho93nfFc+S1OcDLuurEanMFHKblqllYLBJGHtUJ2QSd1jRxHr7OQcSp1MSjEEtJRXO
 aJC0sTXzN3Nab8Nrf6DN+cRvZghba+/FV6qHEDC2Qxpqu8kIdKRESz6T87v8yYKutKbk
 8+BNDqfM2rGgkePaczwnUqd7kS/8VrGWSyhvFd+tSAXz5vmpPamorvlpqs+eKGiddl9e
 WRUuUOfqMQEjK8qKlMfxWkOruoeXCjesMcQm9qtppoHKxmDRW7PKyN0TWq/D1MYL2MX/
 qA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679493444;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WUcZYkCfek8U5HTQqE0ZRnri9xU+leU8uMo6zS0IeAM=;
 b=b8H0Go4xXXfioq+PDqVhXrv5IwAxLR13J44cT1K6tC3Kaxf5eJlM5gRKKJcWnd2QsS
 xx3L35kQYHb0tBqa/K5TCwyADErbNvVTgxwhxqHTfcwkhBv8mUG6mGrKbTItO50giZmR
 Xs1nU55oOsmHmG58/K0snTPEDUerOBowp9L7p3RetnfeL044yeI8CMUiYJXdzVkTZwHE
 DDkEDXStcJkuKB6yKodzCQp2DDFsg9E4JP3cKMHvcqSjmKKDgIh5u5mtJm3eDl1FFqPl
 7DYcdRxRXXG5B8RNU6/nEGMLyTTwPyKuwo1pwJi0Cl7seoLrlAsbI5jZObwSiuijpzsj
 AbfQ==
X-Gm-Message-State: AO0yUKXKQkLCs+X+P20lSdMjrqCtaSkkfajw7BVBmbTM+EMTnYeNyWiL
 0akgbCYpcbhjcP07RU5r2scImmf8uqUB6UTOPn5rwA==
X-Google-Smtp-Source: AK7set97TrIT3ODxYyfX5AuoZpeNLKFzyaJar+xBa++EfmuMZLoTiStKegnUn2WoAhM9dN3Ni3RgPg==
X-Received: by 2002:a05:6000:548:b0:2cf:e8d2:b550 with SMTP id
 b8-20020a056000054800b002cfe8d2b550mr4977930wrf.14.1679493444605; 
 Wed, 22 Mar 2023 06:57:24 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a5d4e05000000b002d75909c76esm7018482wrt.73.2023.03.22.06.57.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Mar 2023 06:57:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jintao Yin <nicememory@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 0/2] ci: Remove cirrus-ci & cover SPICE in MSYS2 at
 gitlab-ci
Date: Wed, 22 Mar 2023 14:57:19 +0100
Message-Id: <20230322135721.61138-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

See individual patch descriptions.

Based-on: <20230322075256.2043812-1-marcandre.lureau@redhat.com>
Supersedes: <20230322110521.59949-1-philmd@linaro.org>

Philippe Mathieu-Daudé (2):
  gitlab-ci: Cover SPICE in the MSYS2 job
  cirrus-ci: Remove MSYS2 jobs duplicated with gitlab-ci

 MAINTAINERS              |   3 +-
 .cirrus.yml              | 111 ---------------------------------------
 .gitlab-ci.d/windows.yml |   2 +
 3 files changed, 3 insertions(+), 113 deletions(-)
 delete mode 100644 .cirrus.yml

-- 
2.38.1


