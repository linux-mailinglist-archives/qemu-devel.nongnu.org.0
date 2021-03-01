Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A68327DD4
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 13:05:18 +0100 (CET)
Received: from localhost ([::1]:55148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGhIc-0008HP-0J
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 07:05:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGhGm-0006wz-J0
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:03:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGhGl-0004jF-7F
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:03:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614600202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YsyuZdjVtZLl/pBvqNpqWSw+FyYwnFzTWSxiB17NW3I=;
 b=IxKk3xhttR4RraR64pq+go5IVswNVhiXtKf0YA5EBqlzP+mwcDRE08rurNn/aeY8kqURYs
 iE8Xit790nwJfNNqMmE+pz04WX3GAmqZ277zml139lWvM0njf0g0u8dlrgIkEs/n0XPw7+
 n45zVPPeFMCoMpY2a6mJ0hqzbQN/8qc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-3w4hGGv7OAGc37E9H7ZAMw-1; Mon, 01 Mar 2021 07:03:18 -0500
X-MC-Unique: 3w4hGGv7OAGc37E9H7ZAMw-1
Received: by mail-wr1-f70.google.com with SMTP id x9so5411605wro.9
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 04:03:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YsyuZdjVtZLl/pBvqNpqWSw+FyYwnFzTWSxiB17NW3I=;
 b=Cj+Kvg6nUR2MmFWazywR718x6eCTH7CaGDL5hf5CGZ2mFTrQqBK3eAmRvXcl+B9QFt
 PaLX9UR8BV94QqGkoqWkuKrQXKOyahQfzgUrsTO0Cli1wvK9n0xVHMMzFZF6Or1srd/b
 RgBP2gVmBbznL/EleigIbM2OFpDtT5jUMuxQjuAD+FUQKhTm5syxsXV5qfjfb/SLtwhi
 vyfO82Yf4qsS1KTIS5p4UJJoqw9D3WggaP9+MHtVhFO5z+E78zjdh88xO/BBU/kowc03
 bAIc4nARYA8G63z3o8JuqMKy/k3nSWGQ3XIGQugDVelzK6QVyJFAWSmFqiYKBxFLptwk
 S09A==
X-Gm-Message-State: AOAM530rPASas871TGwrS52XnpVFKpl3xbEcUlHmuvMOPQcnMUFOMpSI
 WTzAy4rdFf+RN4TTmDzJD2nJopXQKAbvAF2Jm1lhWpGfkRf51xmsaW5u/AjIZ4Lvi63gsjfJWJX
 6O5O8hp79c5jihIA=
X-Received: by 2002:a5d:4fc1:: with SMTP id h1mr9873185wrw.268.1614600197810; 
 Mon, 01 Mar 2021 04:03:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCezDrnBE5U8O4N6zYerMgYgxBt0ILRbYG1OBLUQSIRhqtHgjDFBYdzf+qPW5eskeGnFntZA==
X-Received: by 2002:a5d:4fc1:: with SMTP id h1mr9873137wrw.268.1614600197565; 
 Mon, 01 Mar 2021 04:03:17 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id y16sm1477553wrh.3.2021.03.01.04.03.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 04:03:17 -0800 (PST)
Subject: Re: [PATCH v2 19/31] qapi/qom: QAPIfy object-add
To: Kevin Wolf <kwolf@redhat.com>
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-20-kwolf@redhat.com>
 <e2114559-e0dd-a9bf-403c-a34874bb271d@redhat.com>
 <20210301115400.GF7698@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2835f94e-2dee-0669-ebd8-bc1601c40822@redhat.com>
Date: Mon, 1 Mar 2021 13:03:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210301115400.GF7698@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, kraxel@redhat.com, mreitz@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/03/21 12:54, Kevin Wolf wrote:
>> Please add a check in object_property_add_child that the id is well formed
>> (using the id_wellformed function).  This is pre-existing, but it becomes a
>> regression for -object later in the series.
> Are the conditions for internally called object_property_add_child()
> actually the same as for IDs specified by the user? For example, I seem
> to remember some array-ish properties with [] in their name which aren't
> allowed by id_wellformed().

Yes, you are right.

> The obvious place to affect only the external interfaces would be
> user_creatable_add_type().

Makes sense, thanks.

Paolo


