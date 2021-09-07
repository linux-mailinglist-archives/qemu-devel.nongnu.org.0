Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1A740238B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 08:41:07 +0200 (CEST)
Received: from localhost ([::1]:43820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNUn4-0002W6-32
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 02:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNUky-0000Kx-KQ
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 02:38:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNUkv-0001OH-2J
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 02:38:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630996730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xiX3pwPpBTBDG/bPm9y9G7V8O1KL5WAZ3LwfWz0hijs=;
 b=Ac2RL1gRT6EpgaPA23PdhfanOH+cBVLqpwh417QMpUUUxgmWRc9ts0Qew0clO/LcKTwhEW
 aBRPUZ6BsLm/YMdGP5+F66lRmD+pWsKVxGtyRF6Ixkw4e/T6HTvramSgxNgD/NmHTUfM+g
 167dCv7/vTwPFDQDu2LxTBFHZJMklSo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-KWFaS1_hObim0b-ML8nZaw-1; Tue, 07 Sep 2021 02:38:47 -0400
X-MC-Unique: KWFaS1_hObim0b-ML8nZaw-1
Received: by mail-ed1-f71.google.com with SMTP id
 i17-20020aa7c711000000b003c57b06a2caso4554469edq.20
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 23:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xiX3pwPpBTBDG/bPm9y9G7V8O1KL5WAZ3LwfWz0hijs=;
 b=ej39ttqXvWjdhWU1eMaNunb66VabEQABmmPAvUEl5HfbrQo6ErP4VProQMSemTFg4T
 I2B10M+4ZvTf/SLmDzVv8xjJ7Ngiv3LU/mPlIHcumrwImks86FjoR2X5FYBIg7g2OKlO
 sAWFHVb0+H0LSTSKQSR/ueUD9tsaQ/H4aH0NjRPg+fetCfHXYrAWFyKjCCjYLEHK4Pj1
 U5huk6BGtGCvzObq29sCXz+wUKwnE5YdmDPR0O/l8mdoV75SN15EgvAbRIi+ajbzBFbC
 el9e5RUafbHpRKaHjBiOSpz/nO0KNBEbfa2W5U+1JkmEG5LDcGfSfYyqhmNnpo5qliYP
 gijw==
X-Gm-Message-State: AOAM530A1tOPii4eDbDgf/0NhPax1qJwdCHTdERCeror1dRvPhJzjoWN
 zd9S9uoyp2Ub+4ZqTPR5AdanOc5EP9nP/az96A+Ka+7uqZo7+NM+TE3FUoApoVkK4NRR0YrQFmd
 vjwGsSs1cE1Wz8hQ=
X-Received: by 2002:a17:906:f24d:: with SMTP id
 gy13mr16678033ejb.395.1630996726293; 
 Mon, 06 Sep 2021 23:38:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzARKJxcYWTXSp3sHIQAtXdET+6WtgrzZytYBvmbKZOfktpaU16zYv30mmUeSZkjnaWnf2qjA==
X-Received: by 2002:a17:906:f24d:: with SMTP id
 gy13mr16678021ejb.395.1630996726124; 
 Mon, 06 Sep 2021 23:38:46 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id a15sm6175267edr.2.2021.09.06.23.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 23:38:45 -0700 (PDT)
Date: Tue, 7 Sep 2021 08:38:44 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v8 0/7] DEVICE_UNPLUG_GUEST_ERROR QAPI event
Message-ID: <20210907083844.712b493d@redhat.com>
In-Reply-To: <YTa9oUveYwTjtaBm@yekko>
References: <20210907004755.424931-1-danielhb413@gmail.com>
 <YTa9oUveYwTjtaBm@yekko>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Sep 2021 11:17:21 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Mon, Sep 06, 2021 at 09:47:48PM -0300, Daniel Henrique Barboza wrote:
> > Hi,
> > 
> > This new version amends the QAPI doc in patch 5, as suggested
> > by David and Markus, and added all reviewed-by and acked-by
> > tags.  
>
> I've staged this in the ppc-for-6.2 tree.  Obviously it has some stuff
> that isn't purely ppc related, but I'm figuring that should be ok with
> the acks from Igor and Markus.  Let me know if there are any
> objections.
Looks good to me, so:

Acked-by: Igor Mammedov <imammedo@redhat.com>


