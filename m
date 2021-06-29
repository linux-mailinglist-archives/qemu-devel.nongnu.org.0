Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5413B7AD2
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 01:54:14 +0200 (CEST)
Received: from localhost ([::1]:33912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyNYU-0005RY-1h
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 19:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lyNXN-0004MF-TC
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 19:53:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lyNXL-0000Hd-Pm
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 19:53:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625010782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I4q2lmBxBMK3vcIzgFCcA+YSchm7AOHMS6+FATvUkag=;
 b=hASKzn8X2rtTdNDdZXp45He3yGv6cmFdD9pluKaCvb0fr1so1QKcORc9oItbHfmTmy7nfh
 +ctynB1tahVedwv7mTMOgD9d6xLTMIt5zOuZ561w9t3YHHFsu1sxkCptBxEdRGDUW88ClV
 aj8PtAf16LFHAaNR2hIaLmt6EKSKQKI=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-hZySnliiNWaAi0QMWYOLlQ-1; Tue, 29 Jun 2021 19:52:58 -0400
X-MC-Unique: hZySnliiNWaAi0QMWYOLlQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 61-20020aed21430000b029024e7e455d67so73797qtc.16
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 16:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I4q2lmBxBMK3vcIzgFCcA+YSchm7AOHMS6+FATvUkag=;
 b=hqFMNmmbAL3ouuddd9G+mkWxXmk8wZcIW3q5YjA8xSHlDwWewSdJc5t8ImRpQ/JJ4F
 +wN7F7d2SCMfF4ERuyQeERuI5xzV+C4ScKAhDf5wUDRUycjznmzICS0Cukb6fhAFn68y
 y6DkcABZyQtIHVFitojFFAOlTf5u6oDtylT9EcHGYrk7a7tomRofQoxG32JP2bNHlHCb
 PzrHrw3oSnBp5/pP/42NOsfgN/cf3rR0to2yIby6lXbFClFerwCqK2t01v76FcpUvHOs
 phmdLRx4igM1kkiq/1yGVPIcHXnqYUaEunAEKhNhOiMM6dFDIZLtMRI213UCgCc8o/Ib
 ag3A==
X-Gm-Message-State: AOAM530s/t6Rer6837StGp6PCttN44uNGuGeX4N0nx18vaAodUByAryG
 dJZIWtv3Ex/4fcSkXkw3SXdfO2rM4ie9R1wJBMMNQEdeoOhgUTWe/eLCWKDiTlqidKrFBo/Cu1U
 I8dqxDy3xgTxfQs8=
X-Received: by 2002:a0c:f14a:: with SMTP id y10mr14038166qvl.7.1625010778441; 
 Tue, 29 Jun 2021 16:52:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNXBI9zPg6cne6Hi3uqfUzV5nEPxgZARugzKgH/7tMe2zmSjdFH01QHqFJPXnYqhfLmHhoIA==
X-Received: by 2002:a0c:f14a:: with SMTP id y10mr14038148qvl.7.1625010778241; 
 Tue, 29 Jun 2021 16:52:58 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id s25sm6280469qks.129.2021.06.29.16.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 16:52:57 -0700 (PDT)
Date: Tue, 29 Jun 2021 19:52:56 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [PATCH 0/2] migration: Two fixes around yank and postcopy recovery
Message-ID: <YNuyWExDJ6kcl3WJ@t490s>
References: <20210629181356.217312-1-peterx@redhat.com>
 <CAJ6HWG4UZroY58qZRhRBabe8vidvWfDCHQ=NdLDK=dNV+H2Trw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG4UZroY58qZRhRBabe8vidvWfDCHQ=NdLDK=dNV+H2Trw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Lukas Straub <lukasstraub2@web.de>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 29, 2021 at 07:38:32PM -0300, Leonardo Bras Soares Passos wrote:
> > (Leo: please let me know if this series didn't fix the issue you used to fix)
> 
> It does fix the issue, as far as I tested.

Thanks, Leo!

-- 
Peter Xu


