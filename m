Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D86337B64
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 18:54:02 +0100 (CET)
Received: from localhost ([::1]:40138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKPVZ-0001pc-9v
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 12:54:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKPSM-0000ae-Mu
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:50:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKPSL-00032o-Bs
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:50:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615485040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0XFHEy/ChuU1Oo2jX4Awz1tYi0ZCl2xZzMmqZWiUU10=;
 b=Hie5fZlnvq8BNjdAJP11cgAlOguhdJUePxYVfIccpOHLgaZB5GljcHLLx+ZXH6/CzeAEsI
 RWA7y7MWwWY1D+WmRTUsTqB5HD6+GRZvpwezRMMBd5mQFcPQpClpgmLAbcq9KifykHk5UR
 ouvGfvvHVJ6ALOnoHOlOY9pAy7L9NuY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-rqhBR9UbPZ-eYIHTIGA9og-1; Thu, 11 Mar 2021 12:50:36 -0500
X-MC-Unique: rqhBR9UbPZ-eYIHTIGA9og-1
Received: by mail-wr1-f69.google.com with SMTP id e13so9852552wrg.4
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 09:50:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0XFHEy/ChuU1Oo2jX4Awz1tYi0ZCl2xZzMmqZWiUU10=;
 b=BE20bfzQvPJbVhbUjAoLlf7sHxhn6q000rZjuRuLYpT0KN+I2AV/ge1xfyY8FdOVCN
 eMMmIl7UvbXOHi2MwoHoF3nUJ/Zyhn7lpxj5mLHJTIm1ZNhyZl1LmvnNh1Dj0OMebLYI
 jBeKoOKuL8TCIVa/8y9uBR+a3zxTabhW96g2GzezNKFPIVt3AaNT6/Wu88xvz1qULI4I
 t9WphdwP5J+okP2iqy3YzqQTzbA+5vpqTb3/ycoq/KUT6vXY8Qo/NH6IL6NJeNfdUfV9
 tXqf0jPPk0nSI6NXl/BsswWpkpninURITcRje0FpBHj07IWB0jfiELrcRi3pbjVmKP1C
 IMew==
X-Gm-Message-State: AOAM532hom2XffL9CK7l7EZR2s6Ik9zcGQZqG2MLwaCVi9MBkFj84Q9x
 JgyMJADD1YtjgBPZO1zKhTp3twniz0Myp1qhbCha0sDT5xPIs/xJSvZ2r09v2tSB5iJ4HzgGRhq
 ithMvZhIGvtQao50=
X-Received: by 2002:a5d:570c:: with SMTP id a12mr10039308wrv.209.1615485035727; 
 Thu, 11 Mar 2021 09:50:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw92KVZhOjAretJXR4eb8Kkq+4u6OQxCxni30FY4qDqQF9M8yIdapp/Zg4jMuoKxclmvvs+AQ==
X-Received: by 2002:a5d:570c:: with SMTP id a12mr10039291wrv.209.1615485035594; 
 Thu, 11 Mar 2021 09:50:35 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z2sm4789189wrv.47.2021.03.11.09.50.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 09:50:35 -0800 (PST)
Subject: Re: [PATCH v3 00/30] qapi/qom: QAPIfy --object and object-add
To: Markus Armbruster <armbru@redhat.com>
References: <20210308165440.386489-1-kwolf@redhat.com>
 <YEjWQnWKbr5teciB@angien.pipo.sk>
 <90130a0c-7f96-f344-b185-b790c5d6b78a@redhat.com>
 <20210310173044.GF6076@merkur.fritz.box> <87ft12q8kf.fsf@dusky.pond.sub.org>
 <e98a5eb7-4716-a0f4-0ad2-adaa4cd9cefa@redhat.com>
 <87h7lhbx6b.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <10fd7cbf-9ee5-3869-22fd-352e42a980ba@redhat.com>
Date: Thu, 11 Mar 2021 18:50:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87h7lhbx6b.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Kevin Wolf <kwolf@redhat.com>, lvivier@redhat.com, thuth@redhat.com,
 Peter Krempa <pkrempa@redhat.com>, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, kraxel@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/03/21 15:08, Markus Armbruster wrote:
>> I would rather keep the OptsVisitor here.  Do the same check for JSON
>> syntax that you have in qobject_input_visitor_new_str, and whenever
>> you need to walk all -object arguments, use something like this:
>>
>>      typedef struct ObjectArgument {
>>          const char *id;
>>          QDict *json;    /* or NULL for QemuOpts */
>>          QSIMPLEQ_ENTRY(ObjectArgument) next;
>>      }
>>
>> I already had patches in my queue to store -object in a GSList of
>> dictionaries, changing it to use the above is easy enough.
> I think I'd prefer following -display's precedence.  See my reply to
> Kevin for details.
> 

Yeah, I got independently to the same conclusion and posted patches for 
that.  I was scared that visit_type_ObjectOptions was too much for 
OptsVisitor but it seems to work...

Paolo


