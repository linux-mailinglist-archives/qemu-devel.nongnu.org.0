Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 751E6559D04
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:10:18 +0200 (CEST)
Received: from localhost ([::1]:53302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4kwr-0001QI-Hj
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4kuS-0007N0-EF
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:07:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4kuP-0003BR-Td
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:07:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656083265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=gAxImSpRtiKGx0JHHCkMocNTsrAGif57BHBaTnk37v+momEAbR63WYZaIzF239dsDGUP4Z
 rlg8FX8oBNLk2nu5vpasYGl0ijZzD7gyKd1jSPxl5Ff/CmATORd8csXOPWjFEvDZFiXiKZ
 QMcq7edhBtcl1mPH56ZElcIYW2O9pXc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-z5wgZIyhOl2Pa9AMNflDLA-1; Fri, 24 Jun 2022 11:07:44 -0400
X-MC-Unique: z5wgZIyhOl2Pa9AMNflDLA-1
Received: by mail-ed1-f71.google.com with SMTP id
 x8-20020a056402414800b0042d8498f50aso2036528eda.23
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 08:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=03AAaSBhR9Krev6FYc53PhydleMj9VKWHKyoqFBw5jvk7rVn7n9DrUTmaAC5gjPBhH
 V++eIndjJ20OoNlwQrZdjUfbIlpJeJgK2puU5Gly8j/zGHtw3MYnEUOeCZpf27BKDoqc
 7BgrO+vPP9YrAJcO4+4ZMwZ041Hso8lJ2ORZU3hcQGGyEdxHb+ukDWwDG/Kg4pfQnQul
 Je4PCyioALadMs37QsKpzEQe5ZaMmOhexihEQqtn7ptZyDkdVsSBSl3LfiwL96g/ZseS
 amyTN9D7t3qo5J9sx65OYI1qXF8HsQRl6KoMrED6su3LPoLHJDmWcHXOC7lnvT4Q96i1
 o/TQ==
X-Gm-Message-State: AJIora+yHji1xpnpfqPRcA0zZ2SlvbOJbc1gXUK4C3/eN4ihsSuACuNk
 sLwme43ygn+3yAmpzzXGchEcs51jiCgmd/9IspTa9udnhNp5fD/K8mMVIDK90GP61hS2+ocHJR7
 NTYtZxqjfipbAlAw=
X-Received: by 2002:a17:907:3f81:b0:6ff:1a3d:9092 with SMTP id
 hr1-20020a1709073f8100b006ff1a3d9092mr13797756ejc.319.1656083263195; 
 Fri, 24 Jun 2022 08:07:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tjIvk/yaSNYUHYfSaJqhlP1asrTn2K8RgTgDcKELWmTKnNhICAOWq8X+t0WtcxW1KTesH7JA==
X-Received: by 2002:a17:907:3f81:b0:6ff:1a3d:9092 with SMTP id
 hr1-20020a1709073f8100b006ff1a3d9092mr13797734ejc.319.1656083262991; 
 Fri, 24 Jun 2022 08:07:42 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 b19-20020aa7dc13000000b00435959d3605sm2217040edu.84.2022.06.24.08.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 08:07:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Subject: Re: [PATCH] qga: Relocate a path emitted in the help text
Date: Fri, 24 Jun 2022 17:07:34 +0200
Message-Id: <20220624150734.273653-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624145455.50058-1-akihiko.odaki@gmail.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Queued, thanks.

Paolo



