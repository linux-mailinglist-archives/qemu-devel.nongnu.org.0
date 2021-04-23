Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61002368E32
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 09:58:25 +0200 (CEST)
Received: from localhost ([::1]:56556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZqhj-0006nj-Qq
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 03:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lZqgn-0006Ne-Io
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 03:57:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lZqgj-0004PO-2W
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 03:57:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619164640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ctrQuPienbscB7Z+NYZPaCIoOSc/kzbl99ZBfWpDvHg=;
 b=fSVxACbFA0hs3F81pLxk61BUwTeTYdFHW8aDgdwEiJVDKMUyXrXCPpq4GwsJKjhspUU2ps
 mKK/6lI0C4S82va3Ww9D73Z8W0v77RECrbOHojVnt/iaGECUfk+hjomq7qEFiq9tZ6z+3C
 /NuhvnzIS/K+1AF8NbL8/omuyaO8LkQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-41hjZHPpMlmGGh8Voso3PA-1; Fri, 23 Apr 2021 03:57:16 -0400
X-MC-Unique: 41hjZHPpMlmGGh8Voso3PA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58BE081744F;
 Fri, 23 Apr 2021 07:57:15 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-74.ams2.redhat.com [10.36.112.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9CB310016DB;
 Fri, 23 Apr 2021 07:57:09 +0000 (UTC)
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <YIFMt+xg+xH+M4rd@redhat.com>
 <CAFEAcA8r2k9f=XG6T_hYk542-dDJnR7Lr8DZnyc=SFgnzNYxxQ@mail.gmail.com>
 <089df242-8788-a162-4a75-4c9c9e04a64e@redhat.com>
 <8afd0f34-7e75-2661-9ea5-3ebadff3b85d@redhat.com>
 <2ec6e995-6833-1ebd-03c8-a3fede7fddb8@de.ibm.com>
 <e4116908-7172-fd9c-1837-82c489b61620@redhat.com>
 <c95369e4-ffc9-d01d-45c1-4daad0ead6a5@redhat.com>
 <20210422155238.kak7tl3xnup5vod7@steredhat>
 <da8f7353-8e2a-82f9-c324-18321649ccb5@redhat.com>
 <fb127bc3-aa4a-dc04-484a-d747c3aa503e@redhat.com>
 <20210423064001.fjouibdcwadtgijy@steredhat>
 <b167616b-1908-1a76-a2af-35b87c05d570@de.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Compiling the s390-ccw bios with clang (was: Re: s390-ccw: warning:
 writing 1 byte into a region of size 0)
Message-ID: <8abfb851-a5d2-8608-fe96-2eb3014adb96@redhat.com>
Date: Fri, 23 Apr 2021 09:57:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <b167616b-1908-1a76-a2af-35b87c05d570@de.ibm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/04/2021 08.52, Christian Borntraeger wrote:
[...]
> We can of course discuss if we compile the BIOS for z10 instead of z900. TCG
> in the mean time can handle up to z13 and z10 is now also 13 years old.

I'd really like to see us supporting Clang in the s390-ccw bios, too, since 
it provides additional useful compiler warnings ... but switching the -mz900 
to -mz10 here also means that we could not boot VMs anymore that use a CPU 
that is older than the z10...

Is anybody still using such old CPUs? Should we maybe deprecate all CPUs 
that are older than the z10 in QEMU? Alternatively, we could try to detect 
Clang in the Makefile, and only use -mz10 in that case and continue to use 
-mz900 in the other case...?

  Thomas


