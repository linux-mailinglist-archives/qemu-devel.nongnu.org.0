Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47843D756E
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 14:57:58 +0200 (CEST)
Received: from localhost ([::1]:37776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Mej-0003wj-FO
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 08:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m8McH-0002pF-3Z
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 08:55:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m8McF-0005ak-J0
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 08:55:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627390523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1YoTABc/rb3ynkgR9u6XpafQLnQyD1LpZ6B9ZVVqW8I=;
 b=fD3QOyFLrTRuc8oT3CbDgA4kDNb6F9d269siKfD1+dQKaagIlJKGbnFFBrcc53F+vd9pmE
 cDGxa3Q97n5kVy4lSfzis4k61YEDNLHhSiTN6iHbRwnzUvGlP6JtY1ePY2BwGm/n/tETLT
 Epe64BBBLza0TrXX8VifTBsEeVEL5NE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-2l5smstAPvyWZmLO0z7H_Q-1; Tue, 27 Jul 2021 08:55:21 -0400
X-MC-Unique: 2l5smstAPvyWZmLO0z7H_Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 p2-20020a5d48c20000b0290150e4a5e7e0so5920569wrs.13
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 05:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1YoTABc/rb3ynkgR9u6XpafQLnQyD1LpZ6B9ZVVqW8I=;
 b=qHJcsWrTS1jDPLqTi5F6zbV6YdhrTcSqilUrtkHiMtrTS0OtgXGr3NlOj1oF8cOOWC
 eyqlgrkZ1tkGhU9OkIPfbz25mk8NpvvPcJbzCshx5EfkgTr7XP6aFLU0qbBq69Xevz75
 1UN3P8BnvqJ3wU5T6xs8C1jdquw77XP07ZmbvEDs0PWsF6/6hGqJH8VbeoIH8id5/uP1
 Y7EXzMx8ZC7QyjMnzXzvWFNxsgYzF4u1KUvIkRN8tzPcbJDQxLlb/dqbVnPoAfQkQB5w
 Dc/WQFM4mgsEP2qmWDQcsSZ1A32ZF1sOu2SKw+UsXDR0CIFCbdHtfEH8kPjfWhkmUpzE
 be5Q==
X-Gm-Message-State: AOAM532JScpPzjDqr9fOdVsljnT6avpm+oRvB99NUcS4y5AIJ7WefPMy
 i3k+8Qc+840DHPZ0ugX4AoJJatIQUu+9+eZY9DhO+ZppBCWkpyTGF9521JXSsLJgaYpWxYiwFmy
 V61exdhW1d8+m9ZU=
X-Received: by 2002:a1c:9814:: with SMTP id a20mr12477824wme.158.1627390520567; 
 Tue, 27 Jul 2021 05:55:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxva49/00J8U8jMuhp9rKAsifNRxgmlYAnQdjIlxpd2+j5m+LbmdspDJjkZlTP0jKnFdp/0w==
X-Received: by 2002:a1c:9814:: with SMTP id a20mr12477797wme.158.1627390520338; 
 Tue, 27 Jul 2021 05:55:20 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id a191sm2917518wme.15.2021.07.27.05.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 05:55:19 -0700 (PDT)
Date: Tue, 27 Jul 2021 14:55:18 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v5 00/10] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Message-ID: <20210727145518.2691c7c7@redhat.com>
In-Reply-To: <20210720165751.52805aed@redhat.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <20210720165751.52805aed@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PS:
If I haven't said it already, use checkpatch script before posting patches.


