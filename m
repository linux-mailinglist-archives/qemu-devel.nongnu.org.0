Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326A76F16EB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 13:40:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psMR9-0004LH-RD; Fri, 28 Apr 2023 07:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psMR6-0004L4-Bz
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 07:38:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psMR2-0005my-N5
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 07:38:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682681922;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=WErAeRVZ/m2OZ6MnR55Jmtsj9SitJvvpPb0pWe81kdE=;
 b=ZGXs3/wVMSJ7kGtGnHx7UTfYweVtvK7wJ6yanV7Jue6L5Zed+du2v7p9U6kIwHBuChgZly
 AIk+obbo73wwARRbDUGgBDK/+tN2UfuDC0AjT23Qs+9yDKTGuWOrAuCFyqImJDNztgUdW3
 WkjuPA9XT5Ofs+1GIPjiKAYtsd5y+UE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-jq5mtqoLMz6Kg556CP9fsg-1; Fri, 28 Apr 2023 07:38:41 -0400
X-MC-Unique: jq5mtqoLMz6Kg556CP9fsg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f3157128b4so38103265e9.0
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 04:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682681920; x=1685273920;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WErAeRVZ/m2OZ6MnR55Jmtsj9SitJvvpPb0pWe81kdE=;
 b=TBmjP8rnJn+M2ypUfSiWv/Gqx822zcTZLZXY8PAaJWs2L+OFYez7rt1Jf4kdHzZcdW
 V6HSCljMxS6yGByriNBq/0BAs1zh2Ks3LDYRxTynhVZBJhGpu35fgeExP4IEK3oYuBJ4
 2G6A2VRhlk7QBFF+skLKd3DsDOkxAcyXgNd/G8uteftJlBMBvWmiGvKdBMOLRsiPIGpY
 7UwSL3L1n3iueOyTPn0L2JW/tO46skaC9fpD9Ar7/YgevUzpf16pvUF2oIAgTFes+mgP
 UqVTskH1l06Cc8AVEB/r05EKPgxOU/HzMZRSzHt7u1Lw96aySUoRfNKcK6Ug0/azu2gN
 bMPg==
X-Gm-Message-State: AC+VfDyRoD5JCQT+Y52sk7sTNHu6i/AIHGLciQQFnJ9AizeHWexVd6BP
 nujkGRePO2lGcukHLCEFHfcRa4IJZDKPFZXzbLimNncyUsaQzTG8gjj03ydkhsKlnb33vRUeknj
 fnTxOG0s9Zf8lqYQ=
X-Received: by 2002:adf:db90:0:b0:2ef:d0de:e8a4 with SMTP id
 u16-20020adfdb90000000b002efd0dee8a4mr4090402wri.25.1682681920135; 
 Fri, 28 Apr 2023 04:38:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4TMnnejUg46zsMzjrXaa7Et35iUS4HzDDDrFveg0JNEU85Fvs9+ACRcauuHsoxO+cujxdy+w==
X-Received: by 2002:adf:db90:0:b0:2ef:d0de:e8a4 with SMTP id
 u16-20020adfdb90000000b002efd0dee8a4mr4090388wri.25.1682681919882; 
 Fri, 28 Apr 2023 04:38:39 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002fe522117fdsm20922195wrf.36.2023.04.28.04.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 04:38:39 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel <qemu-devel@nongnu.org>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Peter Xu <peterx@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PATCH for-8.0 v2 1/2] qtest/migration-test.c: Add tests with
 compress enabled
In-Reply-To: <2f4abb67cf5f3e1591b2666676462a93bdd20bbc.1680618040.git.lukasstraub2@web.de>
 (Lukas Straub's message of "Tue, 4 Apr 2023 14:35:27 +0000")
References: <2f4abb67cf5f3e1591b2666676462a93bdd20bbc.1680618040.git.lukasstraub2@web.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 13:38:37 +0200
Message-ID: <87wn1wb5j6.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Lukas Straub <lukasstraub2@web.de> wrote:
> There has never been tests for migration with compress enabled.
>
> Add suitable tests, testing with compress-wait-thread = false
> too.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


