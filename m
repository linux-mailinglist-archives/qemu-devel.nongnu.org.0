Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4BE6FE279
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 18:29:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwmfe-0001H0-SD; Wed, 10 May 2023 12:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwmfb-0001Gj-R2
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:28:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwmfZ-0003gv-TO
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:28:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683736079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=YdObobiifjqLtDvmp6XUvEwY9UCigePeO00NGToCIMZ4qCrI7WZG45TL2lNMGRvJKYM6zE
 FkF5ajC1+irkjt5o5lWBORy5zE6E62PD2rKW+J0Z22jA0g09h//Zrt0K3dYsBlxZT/NDef
 QMR9vNad/zxeWUx1Wb34Dayj5l37mJw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-alYzaICTOtOZGLqWWAmmDQ-1; Wed, 10 May 2023 12:27:58 -0400
X-MC-Unique: alYzaICTOtOZGLqWWAmmDQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-50bc6c6b9dbso14548956a12.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 09:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683736077; x=1686328077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=KXKKBBP7xSTh2DuuDZTB49wMVi4AiPKp2vjsnT0pxxvVMnjQOjRENCDHBQEDRBpQN+
 pzhH4LM07tKWAtzw82CLcxJ6JLPtTPdSbWmxC2+/T2d2uHxmQ4SMA/dnYKbR6Z7/VaVr
 3/7ORwUV3L2OWB5MgtkEk/cotdhIOELkN5X/pGdqmzH37PB8U7if+LbzvdS2DwttuUba
 aW7lLsfeJGTDbPDgYwtmp6DsuLtQ/FLEbVCSZFFULUjMVDanUuSL0QXZ8fEObrGWSqjg
 WfL0cT/bN5YpV/qpGrykML78SY2SpvLiW2vuIa0feWooxbTn5RzkOyNLmFSknTQ+Og19
 b5dg==
X-Gm-Message-State: AC+VfDxB4/mEKpKhFXFhoaZrXlFppcz1Bylm5QPVJXs7YQHb0C9tZgSA
 iF3KLaRHxVjf3bWRfEtDRKu2+JYYlqpJ53a2TkmFz3whjz67FSmRIa2IsXlgi8pPuikM36G+uoq
 UgRxiuUth1APbjhg=
X-Received: by 2002:a17:907:7d8e:b0:96a:4a37:d17c with SMTP id
 oz14-20020a1709077d8e00b0096a4a37d17cmr378695ejc.29.1683736077316; 
 Wed, 10 May 2023 09:27:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6M/IOA/cWsf45x2lMfCd/bQckDfZSqnIPm7MQelTDaSbPXdfuWyHQkQOsNfceBQBBDxApK+Q==
X-Received: by 2002:a17:907:7d8e:b0:96a:4a37:d17c with SMTP id
 oz14-20020a1709077d8e00b0096a4a37d17cmr378683ejc.29.1683736077038; 
 Wed, 10 May 2023 09:27:57 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 lt14-20020a170906fa8e00b0094efdfe60dcsm2794981ejb.206.2023.05.10.09.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 09:27:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] make: clean after distclean deletes source files
Date: Wed, 10 May 2023 18:27:55 +0200
Message-Id: <20230510162755.1266280-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <1681909700-94095-1-git-send-email-steven.sistare@oracle.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Queued, thanks.

Paolo


