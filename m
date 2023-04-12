Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F18436DFF21
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 21:50:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmgTB-0007yg-RE; Wed, 12 Apr 2023 15:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmgT3-0007wT-Bd
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 15:49:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmgSz-0007yy-Er
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 15:49:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681328956;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=QrsS0i+mBnhSA4w9vH61xgAd98nYOBZk0F/0gd9dExo=;
 b=WQijESWNk55x8PyZVQlUjobett2yetZSq9//LyXUBGQWjKwZJeC+Nb8oozzKe8o0k4oTER
 iaMpe7mpRRCa+VS0JMwUzzC9hbuL1K91yj5IqCr7s+AfVXfo0elG0ZNrV0IzjK85+jqaQ4
 3FQL+9mt8ckLFYyPFLNAc88iyutLqbY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-dGl4shZNPuiGbhEh3ZXghw-1; Wed, 12 Apr 2023 15:49:14 -0400
X-MC-Unique: dGl4shZNPuiGbhEh3ZXghw-1
Received: by mail-wm1-f69.google.com with SMTP id
 k24-20020a05600c1c9800b003ef6ed5f645so2771969wms.9
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 12:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681328953; x=1683920953;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QrsS0i+mBnhSA4w9vH61xgAd98nYOBZk0F/0gd9dExo=;
 b=ZdUkTkVCwote1XYZ4ekth8sAHlQmtnNhJmE7qDtXKc5Fu27Z88z4CdqHqH+qVw0cfF
 gcxoFTktlvKgsUIIw9SC54jacXovjG76SliiGsauLCHn5jfMwgIHLRcuRQvrZcaGoMbw
 SayciouiDyDgTS2Ce/OUxXEAOTebyxxLV2k4WDMNjn5tfNY9xlsVb/+bj48F0VmXPxgV
 d/Q2VTUJ2c623lReUqzozcgxIAirawsjDQ2XME4YY0R8DfwHTjlOuBAwWTvzjcJBMR5d
 Wi9UCvfVKrIeDhqTHjCMxVgGHZukTwnapkCXVOhD7Dnc2mMuoD5rnPROCae+U8TB5Lrn
 g9zQ==
X-Gm-Message-State: AAQBX9ezQLFqgO+ZDCt0y0gxtuxFtxZDSslsXs31IBua3CBQED+6RFdV
 rYVjPnVox2kuAodZvT/s6C/9dmerAZyTv5syQKBAFitHzycB20FDelj+t3r5ljIC4MS+GIBO3r+
 UWFaMYDunx1tKvAs=
X-Received: by 2002:a7b:c30a:0:b0:3f0:310c:e3ce with SMTP id
 k10-20020a7bc30a000000b003f0310ce3cemr39652wmj.17.1681328953374; 
 Wed, 12 Apr 2023 12:49:13 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y9+9uWkd9gvjEo35+RfhBGaAd7tQs+8Hbx0DTmTsjSejwf33SIOtNi+FUyFhpXUovVSNjQfQ==
X-Received: by 2002:a7b:c30a:0:b0:3f0:310c:e3ce with SMTP id
 k10-20020a7bc30a000000b003f0310ce3cemr39641wmj.17.1681328953107; 
 Wed, 12 Apr 2023 12:49:13 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 v21-20020a05600c471500b003ef5bb63f13sm3376315wmo.10.2023.04.12.12.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 12:49:12 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel <qemu-devel@nongnu.org>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Peter Xu <peterx@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PATCH 2/2] migration/ram.c: Fix migration with compress enabled
In-Reply-To: <20230402170632.44f2a749@gecko.fritz.box> (Lukas Straub's message
 of "Sun, 2 Apr 2023 17:06:32 +0000")
References: <20230402170632.44f2a749@gecko.fritz.box>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 12 Apr 2023 21:49:11 +0200
Message-ID: <87zg7cnao8.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Lukas Straub <lukasstraub2@web.de> wrote:
> Since ec6f3ab9, migration with compress enabled was broken, because
> the compress threads use a dummy QEMUFile which just acts as a
> buffer and that commit accidentally changed it to use the outgoing
> migration channel instead.
>
> Fix this by using the dummy file again in the compress threads.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>

Reviewed-by: Juan Quintela <quintela@redhat.com>
queued.

Ouch, ouch.

Good catch.

The other patch (the test) needs to wait util 8.1 is open.

Later, Juan.


