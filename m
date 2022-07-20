Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1A557B129
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 08:34:20 +0200 (CEST)
Received: from localhost ([::1]:44008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE3Hm-0001AM-LS
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 02:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oE3Er-0007kt-CA
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 02:31:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oE3En-00029u-BK
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 02:31:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658298672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=eTyPL7LQMV6lMzDqS3GAkObQnkIimZ5/mWy9xy2lF5rz91jES3/CYG6ANga7xYK66eTQ4f
 WFi1mbTcBVnsXL+M6vpR8lvso3RxFu9gxs66NphT0BA3gD3iU8jgpUBj8RqS1sCyAsv6bE
 vrMTbWScUR9CiO1myzZJkapfdIaJJaQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-i613O3lZN-malZhdwEKDEA-1; Wed, 20 Jul 2022 02:31:10 -0400
X-MC-Unique: i613O3lZN-malZhdwEKDEA-1
Received: by mail-ej1-f70.google.com with SMTP id
 jg29-20020a170907971d00b0072b5acf30e7so3651731ejc.8
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 23:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=vGRr6aYKerXGJFjpVdDNA66jStRj+PgujZs8QNnv14dJCtKh1hlh6WlRgg1pTwz+si
 FGw/k6WIL8XYIkNiOcWKuEyPcvwV+dBbw96nWanJlpTalY6rmtMn0Ahw4b/XTDpDZeL0
 nzzY4CWTFs9An4ozZnVqPemqFXEPKBF0CClRKcNaDsXnUVIggIEf6WtDYKfMi5/O0DTd
 TOue7p5MTMMaumtdEWC70VjPQx9d43Ya453gCNQsSEqTyR36D5SCfXsDsJJqTuAvZpRf
 aL3TVuKIbTVedPdrqrt4/IWhy1SdAIlSyQ5Tn7SeNwvr4mu2b6Tz7Fck5hQLHIhtJW3X
 yfNg==
X-Gm-Message-State: AJIora9Tb4yXXD4feCT+7zYI/Op3to0WjcRdfrIBmGeoUvib8KTHoI1f
 lIEZg9JmidKDuBeW2HiaLcYUzVESKNnNnNb4w3RqvJF5KPdHl+bORkp3vzOkXLaBBrvciL9tD+l
 6yGpspnFBnavdWHQ=
X-Received: by 2002:a05:6402:388e:b0:43a:d5ff:60f0 with SMTP id
 fd14-20020a056402388e00b0043ad5ff60f0mr48133844edb.152.1658298669641; 
 Tue, 19 Jul 2022 23:31:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tAlsXYvODlEKVNSIS7qmojar5d49i6GPtDnPPVBRI07GnPHCZpxh4zKTje/5kE5jU+GGTyhA==
X-Received: by 2002:a05:6402:388e:b0:43a:d5ff:60f0 with SMTP id
 fd14-20020a056402388e00b0043ad5ff60f0mr48133814edb.152.1658298669399; 
 Tue, 19 Jul 2022 23:31:09 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 fj12-20020a0564022b8c00b0043a6e807febsm11696448edb.46.2022.07.19.23.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 23:31:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>
Subject: Re: [PATCH v2] docs: Add caveats for Windows as the build platform
Date: Wed, 20 Jul 2022 08:31:06 +0200
Message-Id: <20220720063106.592553-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220719135014.764981-1-bmeng.cn@gmail.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



