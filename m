Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E019625FA5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 17:38:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otX1C-0000vN-NF; Fri, 11 Nov 2022 11:36:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otX18-0000v2-Hu
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 11:36:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otX10-0003Na-R6
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 11:36:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668184585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pTbfcDDLpQxmLFv8a0I8IiAZHRU61BqnYAlSPVwpo/w=;
 b=ad+RLtQn0HcsTA7wft47QzVpWEV717kTubVCwv62FJXvdgxAisYk2l1d9L05wGDQfzoE2c
 RZYCxBijyHzIErlTb2mMZBzPf0LKDLoosyJ+9DwoseaRPeqZz/aEc1UtNmNBhs5vHsF+RP
 ys+On3oPByCocThZqxaDnyh8PWv6BP4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-75-_1nhd6xUPpugK4Wn_9MamQ-1; Fri, 11 Nov 2022 11:36:23 -0500
X-MC-Unique: _1nhd6xUPpugK4Wn_9MamQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 v7-20020a05620a0f0700b006faffce43b2so5085602qkl.9
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 08:36:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pTbfcDDLpQxmLFv8a0I8IiAZHRU61BqnYAlSPVwpo/w=;
 b=GquGNa6ufRnT/ze/Ju5tWW9I6xqd0KSzZ0cvTVmIu+lSryw1Wx4NGkWKsgbFMOtglS
 3ft5kyeIjVV+xR1825QVoazWJZ0XdihAJGxO5LkpLLFD1A1nGS0zi3R7JdXDid0EpgNQ
 y4B7gANNmKV+9fkdohXljHKOM9A1j3n8yPLajbEI0G9NQQHAFeZZKohLyX3xA6Zit66W
 YeL/AMJXefV3i6IOYw7tDj3QJe0zRcosmCVkbY+ZUBDXSp1J7F5jLZqdOrbP+ySnZaHo
 PZP5ORGykbYoJlmLeBnIPeqnIZ4QeMghzl3xoIS2pEob/L9eQpliabutxIygsJb9MLqD
 4PdQ==
X-Gm-Message-State: ANoB5pn2uhUCaw4yHhGAswKTjgmyY8tvCiOqcek3zWxlNJiaK3tIKP8O
 bkTg+SN9lcYhUNGiVcqEUXWZaJpxdlEwlvVfE7vAXpGXbjdQeguUijQySlKixSDX2w+PrFG9nlr
 VGAPdBiD04D3LHDM=
X-Received: by 2002:a0c:9a49:0:b0:4bb:7349:14e5 with SMTP id
 q9-20020a0c9a49000000b004bb734914e5mr2502250qvd.114.1668184583474; 
 Fri, 11 Nov 2022 08:36:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6FhRiW+VRN9BvF3RTxC5mwGUTHeSP8ZSPe/PCjWkPZN0kqsiJfVzgD4jjYhFhG7pgADvpR/A==
X-Received: by 2002:a0c:9a49:0:b0:4bb:7349:14e5 with SMTP id
 q9-20020a0c9a49000000b004bb734914e5mr2502224qvd.114.1668184583213; 
 Fri, 11 Nov 2022 08:36:23 -0800 (PST)
Received: from [192.168.8.102] (tmo-102-67.customers.d1-online.com.
 [80.187.102.67]) by smtp.gmail.com with ESMTPSA id
 k21-20020ac84795000000b003a569a0afcasm1430759qtq.66.2022.11.11.08.36.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 08:36:22 -0800 (PST)
Message-ID: <b8c5f7c4-cf91-1278-1af4-9449b2043e13@redhat.com>
Date: Fri, 11 Nov 2022 17:36:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20221111141323.246267-1-thuth@redhat.com>
 <875yflbl0u.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] util/qemu-config: Fix "query-command-line-options" to
 provide the right values
In-Reply-To: <875yflbl0u.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/11/2022 15.53, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> The "query-command-line-options" command uses a hand-crafted list
>> of options that should be returned for the "machine" parameter.
>> This is pretty much out of sync with reality, for example settings
>> like "kvm_shadow_mem" or "accel" are not parameters for the machine
>> anymore. Also, there is no distinction between the targets here, so
>> e.g. the s390x-specific values like "loadparm" in this list also
>> show up with the other targets like x86_64.
>>
>> Let's fix this now by geting rid of the hand-crafted list and by
>> querying the properties of the machine classes instead to assemble
>> the list.
> 
> Do we know what uses this command, and how these users are
> inconvenienced by the flaw you're fixing?
> 
> I'm asking because the command is pretty much out of sync with reality
> by (mis-)design.

libvirt apparently queries this data (see the various 
tests/qemucapabilitiesdata/*.replies files in their repository), but since 
it's so much out-of-sync with reality, it's not of a big use there yet.

See for example here:

https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg00581.html

If we finally fix this problem with "query-command-line-options" in QEMU, it 
should be much easier to deprecate -no-hpet in QEMU, too.

  Thomas


