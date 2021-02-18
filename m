Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5674B31E7C8
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 10:16:11 +0100 (CET)
Received: from localhost ([::1]:33486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCfPu-0003XG-B2
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 04:16:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lCfOC-0002zi-Cc
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:14:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lCfO7-0000Rv-Tz
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:14:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613639658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A6UvkdITz89SoHuKYlzaXYn3dc9Pc16KJAMyutExhaY=;
 b=RjM+J8WVz+hckl7Fgb0donNPy8Jp4No/ZTySzfN5mcTeYXCd0JiuUAfDlvSFKK0ajxovH8
 OHrj2wO/Y2dLwqAXh3/0cPfgD1bNNv3+R1QOv/qttELdWKE4RU09/aQWJG189RTgR9Iz6I
 8oz3/KgWMEpPVQNpp9S3j3JywxOaEys=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-4xQ2t2e5OcyXMax01CEhHA-1; Thu, 18 Feb 2021 04:14:16 -0500
X-MC-Unique: 4xQ2t2e5OcyXMax01CEhHA-1
Received: by mail-wr1-f70.google.com with SMTP id e12so725457wrw.14
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 01:14:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A6UvkdITz89SoHuKYlzaXYn3dc9Pc16KJAMyutExhaY=;
 b=crDsH88kx+9ny2lIrl+9OVqEAWc93p6297kPk0pI0R+RokVKZwM3czBy+rAXaMdYKa
 dg72Flqgndd7G9YqcGAhmHVTU9qsKauQkvBiW+Cz/hAchW21ZFmmINYLgF4bJrlRV8Qz
 aYo6F6RE2xWU1ksTcI/H/K5eGRZ4JSiXcJBUXxT8Vbpm9xw6NyqI4UyuSnN0DPnItlXr
 e5H9LsXXnqsN8KFag1GsuJ/LeI5I02q4fdkNcB6cKdvGAeVxXtyDV+7ta+pT+37TsCQM
 HiCiC3PEodg7KemCzdwTI45YA15dPKyRBi04494H8A+s0ULmCp4bYnr7wQ04WoLrg3fB
 Wh3g==
X-Gm-Message-State: AOAM5319GHS6+b8Ud/5WZMoqcjduQvLL5nAPsyN//+/21DdX/U5IwN/w
 /goxG6R0cGYB4ZFFYJC5l5Q5tZCvorAeDt1cmSv2FLQTi2ecgIb8G5YOsiTJ4X0xGZG1HuTCZKe
 hWXj4VdK+SiWVd6o/LFwlHoENqdpHJp2QlNyUsH0Wi508irKoLirqEhgpw/bEfwpEQ3U=
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr3357068wrq.51.1613639655055; 
 Thu, 18 Feb 2021 01:14:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyN1hCBlo2PZjA/B849yvP9hznnVjKbagWUTHAngtchSQ+I6D1kdedNIkHzzI0dp5sp1JQSCQ==
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr3357042wrq.51.1613639654792; 
 Thu, 18 Feb 2021 01:14:14 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id z15sm9702942wrs.72.2021.02.18.01.14.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 01:14:13 -0800 (PST)
Subject: Re: [PULL 09/19] libqos/qgraph: add qos_node_create_driver_named()
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <20210215131626.65640-1-pbonzini@redhat.com>
 <20210215131626.65640-10-pbonzini@redhat.com> <2293527.6E2vuH6pv7@silver>
 <2503182.7bSAqF82In@silver>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c7872ca9-4eb9-805c-2fdc-ceda65b89e5a@redhat.com>
Date: Thu, 18 Feb 2021 10:14:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <2503182.7bSAqF82In@silver>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/02/21 10:10, Christian Schoenebeck wrote:
> On Montag, 15. Februar 2021 15:06:41 CET Christian Schoenebeck wrote:
>> On Montag, 15. Februar 2021 14:16:16 CET Paolo Bonzini wrote:
>>> From: qemu_oss--- via <qemu-devel@nongnu.org>
>>>
>>> So far the qos subsystem of the qtest framework had the limitation
>>> that only one instance of the same official QEMU (QMP) driver name
>>> could be created for qtests. That's because a) the created qos
>>> node names must always be unique, b) the node name must match the
>>> official QEMU driver name being instantiated and c) all nodes are
>>> in a global space shared by all tests.
>>>
>>> This patch removes this limitation by introducing a new function
>>> qos_node_create_driver_named() which allows test case authors to
>>> specify a node name being different from the actual associated
>>> QEMU driver name. It fills the new 'qemu_name' field of
>>> QOSGraphNode for that purpose.
>>>
>>> Adjust build_driver_cmd_line() and qos_graph_node_set_availability()
>>> to correctly deal with either accessing node name vs. node's
>>> qemu_name correctly.
>>>
>>> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
>>> Message-Id:
>>> <3be962ff38f3396f8040deaa5ffdab525c4e0b16.1611704181.git.qemu_oss@crudebyt
>>> e
>>> .com> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>
>> Just a side note: The odd "From:" line was because of a temporary issue with
>> the mailman version running GNU lists, which caused mailman to rewrite
>> certain sender addresses. The problem with mailman had been fixed in the
>> meantime.
>>
>> I personally don't care about it, but just that you know that this did not
>> happen by purpose or something.
> 
> Paolo, do you want me to resend these patches as v2 for fixing the author
> rewrite issue?

The patches already in and with the right author.

Paolo


