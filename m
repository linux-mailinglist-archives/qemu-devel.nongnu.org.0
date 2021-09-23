Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDD7415B20
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 11:39:52 +0200 (CEST)
Received: from localhost ([::1]:43416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTLCp-0004Xl-74
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 05:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mTL6y-0003Py-Nw
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:33:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mTL6v-0007Tm-Ny
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:33:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632389624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SMIunjYQSkpJEq9idNsiTaZRoKiSAoq3YttDY5qBnro=;
 b=HRuCHPxSRpq4dQUHQGfTjCc3F4q3HG9p6AS8uv2voRYvVDYm+V3tsCr1O7tw8FmzXQoYL1
 GiJLjzMaDyXkv3kgILWJQTABK46auM5lMgMv6tjw5S5mYLYhkR4ESEy5q67BSY02ZJB0VI
 X64ke1KpEoWojQrBR7HHPfGEv8wFzC4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-WZyk7egcPCmxHVhOV7mE8Q-1; Thu, 23 Sep 2021 05:33:42 -0400
X-MC-Unique: WZyk7egcPCmxHVhOV7mE8Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA9571023F52;
 Thu, 23 Sep 2021 09:33:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE36F5FC25;
 Thu, 23 Sep 2021 09:33:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7A535113865F; Thu, 23 Sep 2021 11:33:39 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 1/2] tests/qapi-schema: Use Python OSError instead of
 outmoded IOError
References: <20210922125619.670673-1-armbru@redhat.com>
 <20210922125619.670673-2-armbru@redhat.com>
 <CAFn=p-YasVLZbFWqx=rxFNLcwyHhBKxcJgeKpQLjDZC2bj-_nQ@mail.gmail.com>
Date: Thu, 23 Sep 2021 11:33:39 +0200
In-Reply-To: <CAFn=p-YasVLZbFWqx=rxFNLcwyHhBKxcJgeKpQLjDZC2bj-_nQ@mail.gmail.com>
 (John Snow's message of "Wed, 22 Sep 2021 14:07:53 -0400")
Message-ID: <87o88jfxfw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: marcandre.lureau@gmail.com, qemu-devel <qemu-devel@nongnu.org>,
 mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On Wed, Sep 22, 2021 at 8:56 AM Markus Armbruster <armbru@redhat.com> wrote:
>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  tests/qapi-schema/test-qapi.py | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/qapi-schema/test-qapi.py
>> b/tests/qapi-schema/test-qapi.py
>> index 73cffae2b6..2e384f5efd 100755
>> --- a/tests/qapi-schema/test-qapi.py
>> +++ b/tests/qapi-schema/test-qapi.py
>> @@ -154,7 +154,7 @@ def test_and_diff(test_name, dir_name, update):
>>          errfp = open(os.path.join(dir_name, test_name + '.err'), mode)
>>          expected_out = outfp.readlines()
>>          expected_err = errfp.readlines()
>> -    except IOError as err:
>> +    except OSError as err:
>>          print("%s: can't open '%s': %s"
>>                % (sys.argv[0], err.filename, err.strerror),
>>                file=sys.stderr)
>> @@ -180,7 +180,7 @@ def test_and_diff(test_name, dir_name, update):
>>          errfp.truncate(0)
>>          errfp.seek(0)
>>          errfp.writelines(actual_err)
>> -    except IOError as err:
>> +    except OSError as err:
>>          print("%s: can't write '%s': %s"
>>                % (sys.argv[0], err.filename, err.strerror),
>>                file=sys.stderr)
>> --
>> 2.31.1
>>
>>
> If you're happy with the expanded scope of the exception-catcher, I am too.

https://docs.python.org/3.6/library/exceptions.html has

    Changed in version 3.3: EnvironmentError, IOError, WindowsError,
    socket.error, select.error and mmap.error have been merged into
    OSError, and the constructor may return a subclass.

and

    The following exceptions are kept for compatibility with previous
    versions; starting from Python 3.3, they are aliases of OSError.

    exception EnvironmentError

    exception IOError

    exception WindowsError

        Only available on Windows.

So unless I'm misunderstanding something (which is quite possible),
we're catching exactly the same exceptions as before, we just switch to
their preferred name.

> Reviewed-by: John Snow <jsnow@redhat.com>

Thanks!


