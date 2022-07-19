Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6375C57966C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 11:35:38 +0200 (CEST)
Received: from localhost ([::1]:42832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDjdh-0002EA-07
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 05:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oDjbX-0000Kj-5O
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 05:33:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oDjbT-0000Kb-Ix
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 05:33:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658223198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=ZwKR98A1D6YvOu1XO40OAbd0djyYu47rHMEP4s4I5o5BY9e16qI9eqI5uDi1l9bFCTNuQw
 8TTV8LJg2I+9u2t/oZ1Olmb4aJ3U8JEuquPLQM3gYosINah+Aw3AXj6E9TXugETVRPIqWk
 L97TZh55FKdx8FynXe0EISU7XR+kaSw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-Y0HU283ROMyTaa7MvOxEIQ-1; Tue, 19 Jul 2022 05:33:17 -0400
X-MC-Unique: Y0HU283ROMyTaa7MvOxEIQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 y21-20020a056402359500b0043adf65d1a0so9566230edc.10
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 02:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=zupH0e4lPgskjOhwNH4/KiQdmbce2jdgN7mVf2s2G1xGI42+C280A/upsJwdm79nhr
 lgZfGUnGGJICQHjSw8wmKAH/glOpi7O0/qJ6/VnLx0WafU2EjQRgi8+lZ7jhFoY5cP73
 Hru5Ql4ByCJ/eDl8Xu69/B2a05D0SNaOkECUk5/z9C9Gidz84Lywi63tZsu80+Vh43ic
 pe3zGSAN31IzerKFsGA+b8uYJe6IFE0958YvXE1MsNgF3cI364NqwED+SQ4etbmKsiMj
 KEBDCzpCzvt7HbtUQEOUbQGvcEeV/K37ex5gHScg8X1oP3dE1m8QlIxjtp/f2ebNSlej
 hDnQ==
X-Gm-Message-State: AJIora+WgGHaPE/BkhzLOrW26pvrC9QRtsous3UjvcAk1KQItwkos8h+
 Xw0PBhIvp3OppHAdyOctxN5PPtl7a8QN1E/DygkQftHlyew23ss0QjaLyCrrIM8bOBA0hcbXx/1
 jQOHzS57c5sf7xW8=
X-Received: by 2002:a05:6402:1914:b0:43a:d548:8adc with SMTP id
 e20-20020a056402191400b0043ad5488adcmr42942543edz.214.1658223196107; 
 Tue, 19 Jul 2022 02:33:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vR5Ys5AGOYRbnvhDMsyEbIpM6WESkbSmIk32KQsKd4G+KryXL/gLifaVgmVeTeVFUjVV/uHw==
X-Received: by 2002:a05:6402:1914:b0:43a:d548:8adc with SMTP id
 e20-20020a056402191400b0043ad5488adcmr42942519edz.214.1658223195877; 
 Tue, 19 Jul 2022 02:33:15 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 dy20-20020a05640231f400b0043ba1798785sm216269edb.57.2022.07.19.02.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 02:33:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Alexander von Gluck IV <kallisti5@unixzen.com>
Subject: Re: [PATCH] util: Fix broken build on Haiku
Date: Tue, 19 Jul 2022 11:33:04 +0200
Message-Id: <20220719093304.528515-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172026.139004-1-thuth@redhat.com>
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



