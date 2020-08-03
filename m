Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C5023A3EE
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Aug 2020 14:18:00 +0200 (CEST)
Received: from localhost ([::1]:45338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2ZPk-0006Bp-2H
	for lists+qemu-devel@lfdr.de; Mon, 03 Aug 2020 08:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k2ZOE-0005CH-KY
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 08:16:26 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:21858
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k2ZOB-0003ey-UK
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 08:16:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596456982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0yYx52LcNuNC1ZomZpQOyiS6GIJBktr33GomtC4+r4E=;
 b=G4l1qw8OpkEd6p2CjFaV6FgxZbqWJSUi+93Fy0gBsnkD+f4PT+wPhFwWdV+/uEolLhK/SQ
 shsSyOX79+yV2+RzXZpgYur1bx1Hjz+xgI+qUlsPC2bwQspHEI+xi+kmCNErUOcEOO7sbX
 VtYAZ+GN/sdTkoXwfwCNyTx/FzsXCCw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-y6d5ss0oNTi6QpK4KvQP_g-1; Mon, 03 Aug 2020 08:16:20 -0400
X-MC-Unique: y6d5ss0oNTi6QpK4KvQP_g-1
Received: by mail-wm1-f72.google.com with SMTP id l5so5430601wml.7
 for <qemu-devel@nongnu.org>; Mon, 03 Aug 2020 05:16:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0yYx52LcNuNC1ZomZpQOyiS6GIJBktr33GomtC4+r4E=;
 b=CFAF6Z9inwrERbcB1ayatVyQVOoJktB6QJaEKd7gRU29bIuZ729OYOXZ74GLY3AUYq
 PDgvKrM6ScVjA9IPBEtcKqoUP8Pq3cqopkWDHOc4rcesmm2ByCfoiihK82Sj3Rx6+/AU
 /SzVBiaG8ETgy6IOfzph0Qe+JRoN7vphpflr9pXsE56gFV/Ru21Mc+B5K8rnw4SJscAE
 NlpzES5LWd/flRyQScCGIyIU9lBDmQ1KYzCVl7YudJZsNUIvQtR0EszWi5INmMlxSXt1
 tBEwhy7VDdyxz58+6oO7sIwEXUUuE0B1NDjA0WzlgldLngu8fccru1ZC+LrpIszqU7gM
 HhAw==
X-Gm-Message-State: AOAM530nBa57DG8pDXlzHEyU2qe85tlDjqT6uxZUsYCUewMHHl0N4Tgg
 f/rcf3B+snGbQ4Y8juAUu9SEt12Go1KmGyftInLWC6eNAHNIliWUg52QT7yIIhhwZSI9N+gDY9w
 xQ2LA3uMyt9Gl7HE=
X-Received: by 2002:adf:c3c8:: with SMTP id d8mr14590848wrg.406.1596456979543; 
 Mon, 03 Aug 2020 05:16:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8V+tlc76LqwXos6iDVj6gi2v1jKcho0H/0hmMfFTqFk85lexFNMubpnh9qKX+G6ierfjatQ==
X-Received: by 2002:adf:c3c8:: with SMTP id d8mr14590819wrg.406.1596456979338; 
 Mon, 03 Aug 2020 05:16:19 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:7841:78cc:18c6:1e20?
 ([2001:b07:6468:f312:7841:78cc:18c6:1e20])
 by smtp.gmail.com with ESMTPSA id s205sm26569003wme.7.2020.08.03.05.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2020 05:16:18 -0700 (PDT)
Subject: Re: [PATCH] schemas: Add vim modeline
To: Nir Soffer <nsoffer@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20200729185024.121766-1-abologna@redhat.com>
 <87ime52wxd.fsf@dusky.pond.sub.org> <20200730093732.GB3477223@redhat.com>
 <CAMRbyysFSFKSOXvYbxAvyf_pqzAxA0KpEgcoJ+5bwa3DbA3x6g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e3a83020-99d8-32b5-fa99-3bc154b01a38@redhat.com>
Date: Mon, 3 Aug 2020 14:16:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAMRbyysFSFKSOXvYbxAvyf_pqzAxA0KpEgcoJ+5bwa3DbA3x6g@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/03 02:56:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/08/20 01:12, Nir Soffer wrote:
> I think inventing DSLs and developing tools is wrong. Use standard 
> format and tools and spend time on the core of the project.

Please don't apply 2020 standards to choices that were made in 2009.  Or
if you do, be ready to contribute code.

Paolo


