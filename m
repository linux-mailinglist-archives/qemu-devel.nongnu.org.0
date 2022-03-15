Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A7F4D9CF9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 15:06:13 +0100 (CET)
Received: from localhost ([::1]:50242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU7oS-0004hv-Nh
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 10:06:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nU7lc-00036D-FG
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 10:03:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nU7lZ-0003GI-CX
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 10:03:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647352992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MKik6AtmKkZjLoAeTfrbKw62PODykM0Fa40qjwa00Cw=;
 b=ZrZAqGVau8Sxjhc1470Ore8CqkcIMd+pDFtNFQrHlYA42vbX1e7hHa8W7U2QUY7hPrtHZH
 p8VOrwdl4jo398nH1DmNDop5BScXTBFMPBnxmIfxolAmQyPAixvwYsBHAtxWgS3CNsu14r
 U582pLsrl2QE/sa2sxl76NEESQgtWWs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-LExbIUHVMB2k-e1e--Crmg-1; Tue, 15 Mar 2022 10:03:10 -0400
X-MC-Unique: LExbIUHVMB2k-e1e--Crmg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7419380390A;
 Tue, 15 Mar 2022 14:03:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CC1AC53741;
 Tue, 15 Mar 2022 14:03:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 32B4B21E6821; Tue, 15 Mar 2022 15:03:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 3/3] Use g_new() & friends where that makes obvious sense
References: <20220314160108.1440470-1-armbru@redhat.com>
 <20220314160108.1440470-4-armbru@redhat.com>
 <20220315090748.acju5mjbe4tax272@redhat.com>
Date: Tue, 15 Mar 2022 15:03:02 +0100
In-Reply-To: <20220315090748.acju5mjbe4tax272@redhat.com> (Eric Blake's
 message of "Tue, 15 Mar 2022 04:07:48 -0500")
Message-ID: <87zglrjotl.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Kamil Rytarowski <kamil@netbsd.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>,
 Michael Roth <michael.roth@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Amit Shah <amit@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, haxm-team@intel.com,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 qemu-ppc@nongnu.org, David Hildenbrand <david@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-block@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, Patrick Venture <venture@google.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Corey Minyard <cminyard@mvista.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Igor Mammedov <imammedo@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On Mon, Mar 14, 2022 at 05:01:08PM +0100, Markus Armbruster wrote:
>> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
>> for two reasons.  One, it catches multiplication overflowing size_t.
>> Two, it returns T * rather than void *, which lets the compiler catch
>> more type errors.
>> 
>> This commit only touches allocations with size arguments of the form
>> sizeof(T).
>> 
>> Patch created mechanically with:
>> 
>>     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci \
>> 	     --macro-file scripts/cocci-macro-file.h FILES...
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>
> I agree that this is mechanical, but...
>
> <snip>
>>  qga/commands-win32.c                     |  8 ++---
>>  qga/commands.c                           |  2 +-
>>  qom/qom-qmp-cmds.c                       |  2 +-
>>  replay/replay-char.c                     |  4 +--
>>  replay/replay-events.c                   | 10 +++---
>>  scripts/coverity-scan/model.c            |  2 +-
>
> ...are we sure we want to touch this particular file?

Good catch!

>> diff --git a/scripts/coverity-scan/model.c b/scripts/coverity-scan/model.c
>> index 9d4fba53d9..30bea672e1 100644
>> --- a/scripts/coverity-scan/model.c
>> +++ b/scripts/coverity-scan/model.c
>> @@ -356,7 +356,7 @@ int g_poll (GPollFD *fds, unsigned nfds, int timeout)
>>  typedef struct _GIOChannel GIOChannel;
>>  GIOChannel *g_io_channel_unix_new(int fd)
>>  {
>> -    GIOChannel *c = g_malloc0(sizeof(GIOChannel));
>> +    GIOChannel *c = g_new0(GIOChannel, 1);
>>      __coverity_escape__(fd);
>>      return c;
>>  }
>
> Our model has a definition of g_malloc0(), but I'm not sure whether
> Coverity picks up the macro g_new0() in the same manner.

I believe it does, by parsing the macro definition from the header.

Regardless, I'd prefer to keep model.c self-contained.  I'll drop this
hunk.

Thanks!


