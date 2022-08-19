Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CDD599ED1
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 17:53:21 +0200 (CEST)
Received: from localhost ([::1]:47072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP4JE-0002lL-BK
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 11:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oP4ED-0003xQ-IA
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:48:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oP4E8-0007LZ-AX
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:48:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660924082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=VSXHHLf5CzYoKbb2p6pMr5PbecwSiCDlGWOm3ex0zvQzDwfugW1A3UdFgcLrgXnQ6TK5kc
 PVABLpv9ZsIJW6gahwjaryNtBFpYrBYWgHardGNLpW7hYkLJOF7H+YOMZxAsCFVrPMqfFT
 zbuXJqF+smFtxzMreT+FCGVJ05N6UDk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-Jqg9j5rJOy6GjRyyoH0nuA-1; Fri, 19 Aug 2022 11:48:01 -0400
X-MC-Unique: Jqg9j5rJOy6GjRyyoH0nuA-1
Received: by mail-ed1-f69.google.com with SMTP id
 y16-20020a056402359000b0043db5186943so2999063edc.3
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 08:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=K99fBAuMToOHGMpGYLL6ZFNHb/S2gr/6sY+DIxhU/hpM2TPnlHfjwl+WN2Id8d1ozs
 H6UpXdV+1qMkSvayFuJBoD539boJAR6aBXKZp78topElrIIsWT4PKVdruODgMq2wWFFl
 FG6Ige9kfI8rrD8T4H3A+mQTfpKYNDyUnrWWdVV3dluW6Qe4/Ww6bZbHoFb4ZI1rT3v5
 Bzrs1gNyKwkbFVoFPnW5ZD8dnrpVTC4spUkTHkN1c8ggcUBWu9iNCISFVWQhJpLbQ6Cv
 8Q8CbjNhqOTaZMOVbgE/agHspL0kIrSZAT4t3yuZW4Ub6yOdBam7R0SiKFXfrgn8Ocfn
 8UKg==
X-Gm-Message-State: ACgBeo2LtS0MhI09a9vWbWaPGIJrhrCZ9wjdxMRYc974/enHIngj5QCh
 QFku0kqmObsNHFuTQ4HXniUfgLAUhvHPhQK4eivxCRExy4hFVat8ljtuZCR8W9unHmuzP6Yq0NA
 Bi8VwJjD17phAkM0=
X-Received: by 2002:a17:907:9808:b0:731:5835:4ac7 with SMTP id
 ji8-20020a170907980800b0073158354ac7mr5284366ejc.125.1660924080332; 
 Fri, 19 Aug 2022 08:48:00 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7m48JJ4gWDbPf/Q3+03MqCCj7B2NYQlOJqscSL7/FOdBItUWGM7AWybePzBH1tk6/dQ6L9Qg==
X-Received: by 2002:a17:907:9808:b0:731:5835:4ac7 with SMTP id
 ji8-20020a170907980800b0073158354ac7mr5284347ejc.125.1660924080100; 
 Fri, 19 Aug 2022 08:48:00 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 b2-20020a05640202c200b00440ced0e117sm3250399edx.58.2022.08.19.08.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 08:47:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: John Millikin <john@john-millikin.com>
Cc: qemu-devel@nongnu.org, Bill Paul <noisetube@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH] esp: Handle CMD_BUSRESET by resetting the SCSI bus
Date: Fri, 19 Aug 2022 17:47:57 +0200
Message-Id: <20220819154757.210052-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817053846.699310-1-john@john-millikin.com>
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



