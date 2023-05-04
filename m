Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B516F7174
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:47:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucvO-0004ed-L6; Thu, 04 May 2023 13:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pucus-0003vr-PD
 for qemu-devel@nongnu.org; Thu, 04 May 2023 13:39:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pucur-0006PG-3R
 for qemu-devel@nongnu.org; Thu, 04 May 2023 13:38:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683221932;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=kQsDN9mFl5EOb49dmr4D7MrnqW45XSEkyuHwgoitXJg=;
 b=VNqXFhWIDZvpMw6w1v4ko4bMJQ5UBxUHzeXOt2jWz61gZ7qqKulyr1cHCWzBgqfBdgBaqe
 +GW83f0uvrYdfbZ0dqsubInu7ubzUCx+Fd3xkAzxRvuqR7fIgM5xEA57Osaa6n9XXgpqCT
 hU37jDY8u/jg74RZqDgn6aO+x77NQ1U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-W_qBp6yaM5O1F-FayMsFmQ-1; Thu, 04 May 2023 13:38:50 -0400
X-MC-Unique: W_qBp6yaM5O1F-FayMsFmQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f1757ebb1eso3312985e9.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 10:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683221929; x=1685813929;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kQsDN9mFl5EOb49dmr4D7MrnqW45XSEkyuHwgoitXJg=;
 b=VJ3Etl9EFOuoX7GhnD+6PKvhV2I01iK+k60Qd99YXPhnLQEwWxzIubL3eU5kVaxzfd
 O/sIfGUa8RQHnc07f5DvwHtw72vsv0FGkd2mt/EiJJxfCT3Jt0DiOl9JEKthOORq6Ik3
 /2/kmSpoeIkr9DnVuDM0E6sjs4V5knecgCIDgFIGTEqTRHq42cltoGD/ZXBXTV0Z6uFv
 nLK/8jlmb39S248ghZXJAS4DO/fFPzu85rzg1n0GaUlxWlkWXhkxOZyC5DKDCQkuz19g
 z/UkBCiOh4oRND9VlIDwY8Mj6uyTfPr/vK4STl3lxGQlPxRwUFkl1E2w28xYx6+y84kP
 Wd7g==
X-Gm-Message-State: AC+VfDzIC5eIZP1c3Ba7xcBwY4R+v9xtQovLWOkXwWjRYCorKXFDecgK
 vsL1qwxaJEcQ9skp74hhkGvDEdoHqpwB7SmPwS4KjjOjEbIKS2dYqUj1/tkDdl8jlSofnO3AIrU
 QQxbfLXFoITu/X5IpD8/5gfI8Eh2I
X-Received: by 2002:a7b:c317:0:b0:3ee:4ff0:83d6 with SMTP id
 k23-20020a7bc317000000b003ee4ff083d6mr263273wmj.40.1683221929432; 
 Thu, 04 May 2023 10:38:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7p4ZNoY7p7O2au7JrTb7XKaj3nepHoQ5ix/gmcdCGcE8z8HB9gS3sqrPFoiN03Tnsa8gL2XA==
X-Received: by 2002:a7b:c317:0:b0:3ee:4ff0:83d6 with SMTP id
 k23-20020a7bc317000000b003ee4ff083d6mr263262wmj.40.1683221929142; 
 Thu, 04 May 2023 10:38:49 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 s13-20020a05600c45cd00b003f1738d0d13sm4389127wmo.1.2023.05.04.10.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 10:38:48 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: David Edmondson <david.edmondson@oracle.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras <leobras@redhat.com>,  Peter Xu
 <peterx@redhat.com>
Subject: Re: [PATCH 1/2] migration: Document all migration_stats
In-Reply-To: <m2jzxo5l20.fsf@oracle.com> (David Edmondson's message of "Thu,
 04 May 2023 13:37:59 +0100")
References: <20230504103357.22130-1-quintela@redhat.com>
 <20230504103357.22130-2-quintela@redhat.com>
 <m2jzxo5l20.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 04 May 2023 19:38:47 +0200
Message-ID: <87bkj0ov2w.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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

David Edmondson <david.edmondson@oracle.com> wrote:
> Juan Quintela <quintela@redhat.com> writes:
>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>
> Reviewed-by: David Edmondson <david.edmondson@oracle.com>

Thanks.

>> ---
>>  migration/migration-stats.h | 43 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 43 insertions(+)
>>
>> diff --git a/migration/migration-stats.h b/migration/migration-stats.h
>> index 149af932d7..0e49c236fa 100644
>> --- a/migration/migration-stats.h
>> +++ b/migration/migration-stats.h
>> @@ -22,17 +22,60 @@
>>   * one thread).
>>   */
>>  typedef struct {
>> +    /*
>> +     * number of bytes that were dirty last time that we sync with the
>
> Minor, but given that you are writing sentences, please start with a
> capital letter.

Done.

>
>> +     * guest memory.  We use that to calculate the downtime.  As the
>> +     * remaining dirty amounts to what we know that is still dirty
>> +     * since last iteration, not counting what the guest has dirtied
>> +     * sync we synchronize bitmaps.
>> +     */
>>      Stat64 dirty_bytes_last_sync;
>> +    /*
>> +     * number of pages dirtied by second.
>> +     */
>>      Stat64 dirty_pages_rate;
>> +    /*
>> +     * number of times we have synchronize guest bitmaps.
>> +     */
>>      Stat64 dirty_sync_count;
>> +    /*
>> +     * number of times zero copy failed to send any page using zero
>> +     * copy.
>> +     */
>>      Stat64 dirty_sync_missed_zero_copy;
>> +    /*
>> +     * number of bytes sent at migration completion stage while the
>> +     * guest is stopped.
>> +     */
>>      Stat64 downtime_bytes;
>> +    /*
>> +     * number of pages transferred that were full of zeros.
>> +     */
>>      Stat64 zero_pages;
>> +    /*
>> +     * number of bytes sent through multifd channels.
>> +     */
>>      Stat64 multifd_bytes;
>> +    /*
>> +     * number of pages transferred that were not full of zeros.
>> +     */
>>      Stat64 normal_pages;
>> +    /*
>> +     * number of bytes sent during postcopy.
>> +     */
>>      Stat64 postcopy_bytes;
>> +    /*
>> +     * number of postcopy page faults that we have handled during
>> +     * postocpy stage.
>> +     */
>>      Stat64 postcopy_requests;
>> +    /*
>> +     *  number of bytes sent during precopy stage.
>
> Spurious double space before 'number'.

Done.


