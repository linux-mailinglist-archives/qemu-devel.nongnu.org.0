Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6159628F33
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:29:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouioX-0000V2-Sc; Mon, 14 Nov 2022 18:24:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouifZ-00068G-Bx
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:15:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouYHM-00067T-EL
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 07:09:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668427771;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XhCcojzPYzlDKTGphSiLuMvrsiNTFjFFhhyaeZDuaf4=;
 b=ZTXhH6oJISAMAuUqqWL/0zemgXNXTrJKOTYztTLgOEqVTf7CUKzKyLp4jlXn0/F1qa3DZ2
 uUNe7bSeWCofNDSU59iUHa4W+lYaH2GA8ROh5nS0zY2AHs0YNyPSu9hgFXSeBvTPWtcyy5
 4YoQ0Iz51cQvFJVxv4AJic5t1BL6fXU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-571-9363vEwoNxi-Xhd0wTaHaw-1; Mon, 14 Nov 2022 07:09:30 -0500
X-MC-Unique: 9363vEwoNxi-Xhd0wTaHaw-1
Received: by mail-wr1-f69.google.com with SMTP id
 i14-20020adfa50e000000b0023652707418so1935452wrb.20
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 04:09:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XhCcojzPYzlDKTGphSiLuMvrsiNTFjFFhhyaeZDuaf4=;
 b=UdEJfdMyAtCsp7UG8W8CuHCQVKe59O7Dh+tqhIPem/VwT0W2e4v/U514kiAoPPPbJJ
 k/5H5ZY0ej1ITnp4i2tmc9/p34XX47IisBFM/VJj5EXZDrnDueazEAoHA0OZPKG8OBzG
 mT0/Y2Dqk/6VejpcgziqKXB0sn6LdWYthtA2QDzd/MTJK2amVM8XBf/CWzp5vXKg06GY
 7pheJUq5bIpZHdFHuDu4Xi/djWSiyaZwhAVH+1t+cEYHsgkYj2XB5MFnE17pcwSfQhpp
 2ZcmTWRqB82T9Xfk9PPIhTysW34c1s6dc8rfDQkZQNQGuTL6upgVbFLCwT9HOuDYR74s
 XJnw==
X-Gm-Message-State: ANoB5pndmnzNy483W70NRywLHfcQDDYvSCtgInmt0/CLeSQ2JZDRZRyH
 1fkuiDlxD0N13mHBOc/dGxJpxfjqKBoUdXa8NH9Ep3DhpYNiMFwdXJOSYOtHSiG0/n1tcVdPtWk
 kn3HLJB59RiVppxQ=
X-Received: by 2002:a5d:5242:0:b0:236:e271:c64e with SMTP id
 k2-20020a5d5242000000b00236e271c64emr7232686wrc.490.1668427768848; 
 Mon, 14 Nov 2022 04:09:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5BJPI9JCSYTCu3HE+rCby44yh/WnmX99tQD2RHjg+0RYVoi32gZsZSVTxEXBRhKw8Arl/7Fg==
X-Received: by 2002:a5d:5242:0:b0:236:e271:c64e with SMTP id
 k2-20020a5d5242000000b00236e271c64emr7232663wrc.490.1668427768604; 
 Mon, 14 Nov 2022 04:09:28 -0800 (PST)
Received: from localhost ([31.4.176.155]) by smtp.gmail.com with ESMTPSA id
 z11-20020a5d4d0b000000b0022e6178bd84sm9460210wrt.8.2022.11.14.04.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 04:09:28 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo =?utf-8?Q?Br=C3=A1s?= <leobras@redhat.com>
Cc: qemu-devel@nongnu.org,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Peter Xu
 <peterx@redhat.com>,  Eric Blake <eblake@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Yanan Wang
 <wangyanan55@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,  Eduardo Habkost
 <eduardo@habkost.net>
Subject: Re: [PATCH v7 10/12] multifd: Support for zero pages transmission
In-Reply-To: <815debf445a2d3003ab2a2900f182554f0c99b3e.camel@redhat.com>
 ("Leonardo =?utf-8?Q?Br=C3=A1s=22's?= message of "Fri, 02 Sep 2022 10:27:25
 -0300")
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-11-quintela@redhat.com>
 <815debf445a2d3003ab2a2900f182554f0c99b3e.camel@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 14 Nov 2022 13:09:26 +0100
Message-ID: <87h6z168ll.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Leonardo Br=C3=A1s <leobras@redhat.com> wrote:

...

>> @@ -712,6 +726,7 @@ static void *multifd_send_thread(void *opaque)
>>              qemu_mutex_lock(&p->mutex);
>>              p->num_packets++;
>>              p->total_normal_pages +=3D p->normal_num;
>> +            p->total_zero_pages +=3D p->zero_num;
>
> I can see it getting declared, incremented and used. But where is it init=
ialized
> in zero? I mean, should it not have 'p->total_normal_pages =3D 0;' somewh=
ere in
> setup?

int multifd_save_setup(Error **errp)
{
    ....

    thread_count =3D migrate_multifd_channels();
    multifd_send_state =3D g_malloc0(sizeof(*multifd_send_state));
    multifd_send_state->params =3D g_new0(MultiFDSendParams, thread_count);

You can see here, that we setup everything to zero.  We only need to
initialize explicitely whatever is not zero.


> (I understand multifd_save_setup() allocates a multifd_send_state->params=
 with
> g_new0(),but other variables are zeroed there, like p->pending_job and=C2=
=A0
> p->write_flags, so why not?)=20=20=20

Humm, I think that it is better to do it the other way around.  Remove
the initilazations that are not zero.  That way we only put whatever is
not zero.


Thanks, Juan.


