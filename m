Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A6A5438A1
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 18:15:49 +0200 (CEST)
Received: from localhost ([::1]:47286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyyLU-0006Uy-A5
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 12:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyyGp-0001rQ-FA
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:10:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyyGn-000205-O6
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:10:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654704656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4zV1jbXjG02TVob19aBNbW/XNH7FBUEthlKJXcPV+xk=;
 b=IF92WVD5cV0wQEoGoQcezqeEWnVuN/3wBPJdJftW9rD+Y5SVjGGHKhRvH7j5YgAVUI7Ump
 5D6K79o1zk3Gll3j3PYn2F4F45cGKnqYdojI4OWpmqUBuTqi7s8ZAEFaa4PT7daxlrZ6uB
 ueaOProwaVJIvcbEeeJ0rnz7lst/5mo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-1eI_nbpQNaKIVXWp8_xdJQ-1; Wed, 08 Jun 2022 12:10:55 -0400
X-MC-Unique: 1eI_nbpQNaKIVXWp8_xdJQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 mb1-20020a170906eb0100b00710c3b46a9aso5041972ejb.22
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 09:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4zV1jbXjG02TVob19aBNbW/XNH7FBUEthlKJXcPV+xk=;
 b=qwat0xeT1TAu0N/M5dyw+MDZXjd9wsGGSbDrQinyT/Heo1SU6yEg7Zd2vvadmvQYMj
 JOiQYsCgP+oHfu8jTOXEU9p6ShpDPfQHrw0Zbz67jyWP/rdOjUAPbb5vB0rhcmmDSY3x
 aXerEhkPTqnrCs2eVRHuMwcSnEEGebUVnDSoHt3KkQSQd+m8vv/UTJonAkYr8cS/On6N
 vWgMtMIxrDneTk9iz1ljFh37AfChYQjpuKisVsloJ6qBi71EUoOblhsNu5Y4lnxFpZ7J
 r2O/HVavyV0FXs2gU1PcE1EhrAkWDzv0Eho9crHd/Qn49J29CdH9OyfHWCOh2meP6iF9
 X+Jg==
X-Gm-Message-State: AOAM531JrrZKDETWr9xoYLyRkNJFwWgqW45uwgLam+iopqZqhDsEYYu5
 D4e/u67ZXf/pCeJkE40rdnqmNp3YR7trCCbxCH0NyaKR/13273nHe4uSOh5vHIinrf7OrsF+VDv
 TSasES6OjC03xGnY=
X-Received: by 2002:aa7:da10:0:b0:42d:d47e:87ad with SMTP id
 r16-20020aa7da10000000b0042dd47e87admr42148430eds.161.1654704654125; 
 Wed, 08 Jun 2022 09:10:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydFynDib+kz7vp08EkLL3W+Ef4nVk+bFLfrjrKfy5RO0j8pKnqfQqjHOZvxJmnRWP+jOUztQ==
X-Received: by 2002:aa7:da10:0:b0:42d:d47e:87ad with SMTP id
 r16-20020aa7da10000000b0042dd47e87admr42148412eds.161.1654704653974; 
 Wed, 08 Jun 2022 09:10:53 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 ee36-20020a056402292400b0042bca34bd15sm12486753edb.95.2022.06.08.09.10.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 09:10:53 -0700 (PDT)
Message-ID: <68b6f1bf-1425-90ac-3bec-103225c405e7@redhat.com>
Date: Wed, 8 Jun 2022 18:10:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 02/10] kvm: Support for querying fd-based stats
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com,
 Mark Kanda <mark.kanda@oracle.com>
References: <20220530150714.756954-1-pbonzini@redhat.com>
 <20220530150714.756954-3-pbonzini@redhat.com> <Yp+ObQxOi/EXc6PZ@work-vm>
 <758db6b4-5786-adf4-d293-d8dc7793a21b@redhat.com> <YqC3pocwSjcp2y/3@work-vm>
 <686d6426-f035-4218-25a2-c212af38ce58@redhat.com> <YqDH6Ec/6937BTT/@work-vm>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YqDH6Ec/6937BTT/@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/22 18:01, Dr. David Alan Gilbert wrote:
> 'Find descriptors for 'target', either that have already been read or
>   query 'stats_fd' to read them from kvm'

/*
  * Return the descriptors for 'target', that either have already been
  * read or are retrieved from 'stats_fd'.
  */

Paolo


