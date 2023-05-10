Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F24C6FE28D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 18:34:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwmlB-0004Tf-B5; Wed, 10 May 2023 12:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwml8-0004Su-Nq
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:33:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwml7-0004gO-Cm
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:33:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683736424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=Z2KjT9VvYqn3JbCkVfofHlL/UzXace+G6335waLhC8FhtxkhbcKMdMapExv7WBWZlXDpuq
 OUfLodkDsqCFXP/uT5KuorO3tzdLi8kLADV6MqjjqSTqkkoa3Rcq+BBHIFiuMQ3My6cDeB
 gf8OaFET/HD2fV6wzf0FBDO6aPhht84=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-_X35W1dCPOeJLEKiLym7fQ-1; Wed, 10 May 2023 12:33:43 -0400
X-MC-Unique: _X35W1dCPOeJLEKiLym7fQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-50bcd24504eso8421909a12.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 09:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683736421; x=1686328421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=ciZ+asqq6RAddnTkXTOlLkx4yJFErOHt67vRV+WzQjcgvviIUDEobv+OfkuAStobj8
 +u/SRpoMWXAqvJbFOYq1k0KuOOQucOgBwNe5Osz/ekYUYXEsQttQDnFRu6GDg9xfF0X9
 v5C//5PW7tpPnVofyeBJr/8UDuZDYZ/h9g5Ka4dOKr+mQCTJmro+Xk8ZLHMLMOxOyJjc
 PAIwiJAxDEPvwmCQB2bLZtQqBRHpo9KH+MfDdSGdAus2A/vOcPwe0f0UqiAx1zinkXWD
 JcxlSHDMtMAUQ0eXTfi+FJ23ZZmQ4/Jm2EkdukTVe1beUYuZBjraL9bICF/+YhMCWbEY
 7cpg==
X-Gm-Message-State: AC+VfDzIsp+3Eegz9yswCL1T4Wfr1ZNPVonT3xhWZnv3NYpj6fBjYVdt
 zZGafkIHGIuAbhirdW18/o3nQLEI2siHxGYibgFj8pB/4TBAKWGRE2lesZRsL3riYZOBcYwdqpI
 //vo9bo3ktZ2nzHz0pQrz6xc=
X-Received: by 2002:a05:6402:b03:b0:50b:c4a1:c6c0 with SMTP id
 bm3-20020a0564020b0300b0050bc4a1c6c0mr15244928edb.16.1683736421765; 
 Wed, 10 May 2023 09:33:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4PEHx3xK+gHfhCYHINsea+Q6ylOz8KKzOk6ApsLsXOBOT1hKPx5yAzTauLn/C5hOIYygJpVA==
X-Received: by 2002:a05:6402:b03:b0:50b:c4a1:c6c0 with SMTP id
 bm3-20020a0564020b0300b0050bc4a1c6c0mr15244914edb.16.1683736421469; 
 Wed, 10 May 2023 09:33:41 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 t21-20020aa7d715000000b0050bc041d2a8sm1976942edq.15.2023.05.10.09.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 09:33:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: lixinyu20s@ict.ac.cn
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net
Subject: Re: [PATCH] target/i386: fix avx2 instructions vzeroall and vpermdq
Date: Wed, 10 May 2023 18:33:39 +0200
Message-Id: <20230510163339.1271944-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230510145222.586487-1-lixinyu20s@ict.ac.cn>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


