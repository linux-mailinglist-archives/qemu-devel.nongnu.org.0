Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7484857298E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:57:47 +0200 (CEST)
Received: from localhost ([::1]:52130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBOp8-0004jk-KM
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oBOaV-0006px-6E
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:42:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oBOaS-0005eK-M6
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:42:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657665756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w/womBJM9+p8CHYASqnms0Z3OK2NvU6mOE/O0uuxHFU=;
 b=aSKC36uPSow5VgXfbogD7u11MJ+UVRdbEvcfjLKe02Xj77s3ofTf5UCTJMYrA+umit+CtC
 DUNRsEcI0Dlw0sTE0HhG4F2/Qz13CfK67ej06BMTrpEyrmGBVgjBOWHPIaARIlF5EKmOWu
 Xw2CqTUfA8RkKbTgmJe4EcZFwvMHwoE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-ycrbRHVgNtquNN0ybFsw4w-1; Tue, 12 Jul 2022 18:42:35 -0400
X-MC-Unique: ycrbRHVgNtquNN0ybFsw4w-1
Received: by mail-qk1-f199.google.com with SMTP id
 n15-20020a05620a294f00b006b5768a0ed0so8110431qkp.7
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 15:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=w/womBJM9+p8CHYASqnms0Z3OK2NvU6mOE/O0uuxHFU=;
 b=vVMGiiDNCdbHXTBogAZ9ardEmWv6mKKbIvyIrNm84V8S3WlsJNe1DH1V7TP/dOxlEn
 jMeamppeaWgomfIiD0i02NaJXkqOA7icn4um0jJ0wNVeG/Aeyx/lfAsiJCPMReDuEku1
 ASkiSw0m5L8DbNQXvKCbCrk1jlZIE2dCQTvFNhzSn6OK1kyFq8JGZBWZy50fPjuBlBCZ
 zfJJOYUe1DNjiRlu4p6epb4q3wLEDb5cXcZF4fHsjw2oAdDLR8M5wS5Q/hZqrpWU5/I0
 ecEIeXu0nF/ZMIVKaQHfV8bs6BV9Ih7T8jEj2I+8c30ErdHTOQ7AZncRcB9X3DhaYKRr
 Fflg==
X-Gm-Message-State: AJIora+3kCu++T3Q2EfTSqj4pIiVUnbA9FDXqymRoQmyYAQqUCEZHcME
 uJ9IIb/zIdkfvfMsYFZ7BG7jIBzwySEXA4c+44ts0x3cgpfUn4JCLtDBwVWrsao7Jr+ABTfrv35
 W51tTOReBCZ+Hh6c=
X-Received: by 2002:ac8:5d49:0:b0:31e:c249:1529 with SMTP id
 g9-20020ac85d49000000b0031ec2491529mr252873qtx.651.1657665754489; 
 Tue, 12 Jul 2022 15:42:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vzWW+JxTv8Cr6gFc2n3QWXbkovZtns58qDoXz7PLcnAOyTH557mJubISMT1shNdRpNQCYGDQ==
X-Received: by 2002:ac8:5d49:0:b0:31e:c249:1529 with SMTP id
 g9-20020ac85d49000000b0031ec2491529mr252855qtx.651.1657665754299; 
 Tue, 12 Jul 2022 15:42:34 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-37-74-12-30-48.dsl.bell.ca. [74.12.30.48])
 by smtp.gmail.com with ESMTPSA id
 s123-20020a372c81000000b006b554958bb1sm9537952qkh.26.2022.07.12.15.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 15:42:33 -0700 (PDT)
Date: Tue, 12 Jul 2022 18:42:32 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 3/3] migration/multifd: Report to user when zerocopy
 not working
Message-ID: <Ys342AjeLqyR5LUr@xz-m1.local>
References: <20220711211112.18951-1-leobras@redhat.com>
 <20220711211112.18951-4-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220711211112.18951-4-leobras@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Mon, Jul 11, 2022 at 06:11:13PM -0300, Leonardo Bras wrote:
> Some errors, like the lack of Scatter-Gather support by the network
> interface(NETIF_F_SG) may cause sendmsg(...,MSG_ZEROCOPY) to fail on using
> zero-copy, which causes it to fall back to the default copying mechanism.
> 
> After each full dirty-bitmap scan there should be a zero-copy flush
> happening, which checks for errors each of the previous calls to
> sendmsg(...,MSG_ZEROCOPY). If all of them failed to use zero-copy, then
> increment dirty_sync_missed_zero_copy migration stat to let the user know
> about it.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


