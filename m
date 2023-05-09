Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6AB6FCA57
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 17:36:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwPOD-0007O6-Bt; Tue, 09 May 2023 11:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwPOB-0007Jn-Bv
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:36:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwPO9-0003qZ-TP
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:36:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683646589;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=wITcbsnY8PKyeqbuL2EV/pBqWK3FTCvsw361UG7PfLU=;
 b=DwKKMR2yomk+nz3OJfBg2HqwimjFypN+9AM1yO8gZCMOV+SzHZbDbFerwoNIGD1CHMGTv0
 IBib3f0xoEHn2NJ/rNII9FlVU//zR4EDfrcY5x4aPySVsd/cnx63YalaZDokYOHQrJUXOr
 DqCe/2aq2MZEviXHTFc+jzs/K+LexIU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-E1DICdodPBarU3sHQRVHNg-1; Tue, 09 May 2023 11:36:28 -0400
X-MC-Unique: E1DICdodPBarU3sHQRVHNg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f433a2308bso3645755e9.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 08:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683646587; x=1686238587;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wITcbsnY8PKyeqbuL2EV/pBqWK3FTCvsw361UG7PfLU=;
 b=SgzaOU23RRmECCs6vHupqdrUFrLEeA3TAYFqAaHTURbyWE+B02E8E9EVRcXjWaFA70
 FH+0HxFW0N2IGMYUd6Qf4gT6Qtnzw0+OQxYSstWwlsxfNytFPkaCS+Phykm79TdK4BIH
 wi+4+k9VdTdcw3/xeqAe2x0mCdSIJzEkWn235DfYoVPHL5EYtjo8y4neRZ//MGOF+Z+L
 cyfJABTHOIK2iJfChra44N/M0K6/KJhWJocpkbNrrYO8+XXjIHJTOZst4KU9fZ4NFaPc
 jIckq3RiUGJd2XtKpNoEExXBPC8ygmngCZeEMNWd79US897FaJbxsjhpsSyXIrA8tZKg
 3UUA==
X-Gm-Message-State: AC+VfDzbGgxkfW5gt9VG7l6UWa2Q8GiOncrbC0Z/udPdWJjGDTO7i2zD
 TOSUmWPKQVekEZHGXC6SXi8o77VZwyTmSpUztNAImHh1ZgNTQLw0j9Y520U+Uxmyc5lpO0kphId
 p7XPYm1bVBdocykE=
X-Received: by 2002:a1c:7702:0:b0:3f1:8129:2c53 with SMTP id
 t2-20020a1c7702000000b003f181292c53mr10593810wmi.16.1683646586891; 
 Tue, 09 May 2023 08:36:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6cVdBtvJjyqdqGQU/pSBX2S4CgGRUJWXw9YA3oVELMdk3SqFLnPoml5j+P6mroNw39mzMnOQ==
X-Received: by 2002:a1c:7702:0:b0:3f1:8129:2c53 with SMTP id
 t2-20020a1c7702000000b003f181292c53mr10593795wmi.16.1683646586607; 
 Tue, 09 May 2023 08:36:26 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 m16-20020a7bcb90000000b003f42597a1b9sm6384481wmi.28.2023.05.09.08.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 08:36:25 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org,  kwolf@redhat.com,  Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH] migration: Attempt disk reactivation in more failure
 scenarios
In-Reply-To: <20230502205212.134680-1-eblake@redhat.com> (Eric Blake's message
 of "Tue, 2 May 2023 15:52:12 -0500")
References: <20230502205212.134680-1-eblake@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 09 May 2023 17:36:25 +0200
Message-ID: <87h6slcy9y.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Eric Blake <eblake@redhat.com> wrote:
> Commit fe904ea824 added a fail_inactivate label, which tries to
> reactivate disks on the source after a failure while s->state ==
> MIGRATION_STATUS_ACTIVE, but didn't actually use the label if
> qemu_savevm_state_complete_precopy() failed.  This failure to
> reactivate is also present in commit 6039dd5b1c (also covering the new
> s->state == MIGRATION_STATUS_DEVICE state) and 403d18ae (ensuring
> s->block_inactive is set more reliably).
>
> Consolidate the two labels back into one - no matter HOW migration is
> failed, if there is any chance we can reach vm_start() after having
> attempted inactivation, it is essential that we have tried to restart
> disks before then.  This also makes the cleanup more like
> migrate_fd_cancel().
>
> Suggested-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

I still can't believe that power down disks and decide if restart (or
not) the vm is such a complicated bussiness.  Sniff.


