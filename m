Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D743C49AE4D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 09:46:57 +0100 (CET)
Received: from localhost ([::1]:48570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCHTc-0000pH-VW
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 03:46:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCHAm-00038V-8I
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 03:27:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCHAk-0003XP-Ad
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 03:27:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643099245;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=TO8nFmLKD7iih4yIIFmQ3Tl/KUAlsQnNSK7/URMX3fU=;
 b=Ij+GMpbrX3IB2/4rBWPbU0CkwQT/b4UKxPZlyxhzaGrKItRuyS7GK6LyF3V3Asdq5XpTsN
 qQS9m9RpPMAXq608WKxfwjKGEHQaQA40Xa/2romFufs8JqNjrz8nlc2Y21yAsIOewYSXjg
 m5xtSrlYAbCQRsZb7LDOAgMo1IQKfnM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-2CWEEV6eN5aaczHNva02ag-1; Tue, 25 Jan 2022 03:27:24 -0500
X-MC-Unique: 2CWEEV6eN5aaczHNva02ag-1
Received: by mail-wm1-f70.google.com with SMTP id
 w5-20020a1cf605000000b0034b8cb1f55eso912414wmc.0
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 00:27:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=TO8nFmLKD7iih4yIIFmQ3Tl/KUAlsQnNSK7/URMX3fU=;
 b=WtDHcUhUOFFzO7U8lTD/29KRAFTWFDwR1xKaYCTFmsx0Sv/HtarQPwhpaueNFCNZ9/
 ajL279DSMlPK4+J+BbVO+Ogb/3EqVJX3vWPZaLh2LrgFUkdiaOlJutt/lV6c21QzIJj2
 jPshKgnryPghUUH9J8PwF5Pa7wmzMGHrdiu3qnO91u6WZjMEk8ypz2b4UPXIiUV+VGG4
 J8NCPT/bHJD4DwLDhIaCkKJgBYIFQuFt7Ukg/8Rv3RsruU97jA16NKAThat2vA5FAwDL
 nkCleCCxowliWw+dyrSmsowvVj5WTmbzQVR5O8lQTSqD33weoovfLdMEvm8u+bwB3ut8
 drsg==
X-Gm-Message-State: AOAM530BXK4fqH5kFXOCdl9+5Gwmk1XTa7Ifd7TC66DxuCnhgwTrx1e3
 0tP08AUDKCMH/1oxV+Ltf+yiOQ8fyQI7Z6qDwX2635Y2NnekPdPv7r4piwEC6kz1bkbDojocYhy
 p3bbMWMOLRdniZ68=
X-Received: by 2002:adf:e189:: with SMTP id az9mr17606213wrb.624.1643099243346; 
 Tue, 25 Jan 2022 00:27:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySkHkeNcMIDhPrK4vA/0alCYEB30szt6X9B2qTUxhT9ciFdL4ZinCLmXLLJe3LZJ4uSvP9Jw==
X-Received: by 2002:adf:e189:: with SMTP id az9mr17606194wrb.624.1643099243099; 
 Tue, 25 Jan 2022 00:27:23 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id w22sm2814148wra.59.2022.01.25.00.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 00:27:22 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] Remove unnecessary minimum_version_id_old fields
In-Reply-To: <20220118104434.4117879-1-peter.maydell@linaro.org> (Peter
 Maydell's message of "Tue, 18 Jan 2022 10:44:34 +0000")
References: <20220118104434.4117879-1-peter.maydell@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 25 Jan 2022 09:27:20 +0100
Message-ID: <87lez4w787.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> wrote:
> The migration code will not look at a VMStateDescription's
> minimum_version_id_old field unless that VMSD has set the
> load_state_old field to something non-NULL.  (The purpose of
> minimum_version_id_old is to specify what migration version is needed
> for the code in the function pointed to by load_state_old to be able
> to handle it on incoming migration.)
>
> We have exactly one VMSD which still has a load_state_old,
> in the PPC CPU; every other VMSD which sets minimum_version_id_old
> is doing so unnecessarily. Delete all the unnecessary ones.
>
> Commit created with:
>   sed -i '/\.minimum_version_id_old/d' $(git grep -l '\.minimum_version_id_old')
> with the one legitimate use then hand-edited back in.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Hi

Should this came through the migration tree?


Reviewed-by: Juan Quintela <quintela@redhat.com>

Later, Juan.


