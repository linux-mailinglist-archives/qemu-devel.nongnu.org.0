Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 291B86E74D0
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 10:17:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp309-0005uV-8L; Wed, 19 Apr 2023 04:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pp305-0005uL-KL
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 04:17:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pp303-0007j2-FI
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 04:17:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681892230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=P4KCMdh3EaPahjLLp4m7EjApKjLttypHmp/bpdw5hRFP3WVOZfeFpEJWc1iNQ2hB+mpNwZ
 sZJrqrr5clz3ugQ7BMC7W5k6bcEbChaL4jC5UT95Vx4Lcu0coKaUjej4JpDkuyal6yC4Mj
 k53sWGkuP0C8Ervih394cZtT6lYE7AQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-4Wl9uZ8kMraPo6MsnqO54A-1; Wed, 19 Apr 2023 04:17:07 -0400
X-MC-Unique: 4Wl9uZ8kMraPo6MsnqO54A-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-506b21104faso1165470a12.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 01:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681892226; x=1684484226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=j3obr7XV22zhiIR2QK29pMmBeAT19jb/O7STSbXMNzw+727Ef5iMlFbIU+Y/EUkP35
 w2ur9r6DqESU3ruYfhZaTBbcb4QGQd3Iqlxf0SpRgPI+YdtmYX8Dd3i8SXFkv0rdXrdX
 +cVM9F4E+N3+2B3nak3QYOracCEMmglRzBg+VTUWXyIR8b2jqSkjV0FVo9r+sWZ1XshX
 MmbWRFrPp0n1t3Vipj6G/aSB3vN8Mg1G6mNlhHxSMxSXXBqzLYeQCXCx7WkLozKb0ISS
 Tc4nxXaldtfGSyAR6NcaRrVFlSAvNTVPwcZb61DcmHp88Vv9alNGtAqUMZmS7D285kTc
 advg==
X-Gm-Message-State: AAQBX9cFcNo5yVg18wTu7C5dM5gW70Uj0ealBANEdnAbsYuVAN8WjdFi
 tJQtlFjq/YOQV+Jc6RID4VPHfA0HrAL98n2AsQjtHojTVrtf6rimhiWkGp5c6TdznTMHz7VD6jk
 at9/tbWGCVieJF7k=
X-Received: by 2002:aa7:cb0d:0:b0:506:b120:8df2 with SMTP id
 s13-20020aa7cb0d000000b00506b1208df2mr4203473edt.12.1681892226024; 
 Wed, 19 Apr 2023 01:17:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350aUBaTsiajEiR7nUxNrR/GjWp2XGooMbikHA5lu8o9/DLhOWub1UGEECNl09BTRGczdgHYM9w==
X-Received: by 2002:aa7:cb0d:0:b0:506:b120:8df2 with SMTP id
 s13-20020aa7cb0d000000b00506b1208df2mr4203453edt.12.1681892225722; 
 Wed, 19 Apr 2023 01:17:05 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 r7-20020aa7cb87000000b0050687ca0c92sm5999938edt.84.2023.04.19.01.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 01:17:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] configure: Honour cross-prefix when finding ObjC compiler
Date: Wed, 19 Apr 2023 10:17:02 +0200
Message-Id: <20230419081702.315670-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230418161554.744834-1-peter.maydell@linaro.org>
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


