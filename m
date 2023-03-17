Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDDC6BE90F
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 13:18:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd90x-0007n1-3v; Fri, 17 Mar 2023 08:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pd90s-0007jz-Uu
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 08:16:50 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pd90p-0008If-Uo
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 08:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=tR9I57IoMA6q1uKtK9tid77N/WYpDh/qdQqsuN72UBc=; b=oPl9P0O4vvO4a2oeMNX/OQF4qy
 +Tl+AO2afDsN0n5KaPN3x/dHiTozX/myaMxBB2QuxjKj0fpDemOABLeWNOTkTrRDUlnh3o/qMIwtf
 jmI4Z53a+p774TniX3yNPXjqff0Pe2gKlvyM9gcYcXS8CKbO3hilFjX2wJmhvsoZK76gXuC4E2wnl
 +KsJxF8GeSkLlWKRRTx63z7L/25bKUC/FMo3qTJmsTjPTcLs/wA372smFV8FPI4eu4CHOlvs7SW0O
 7ozLcV3+3pjHuNj+nndc+INv1iHVx+Cqo8/okpge3HzQo2EMCg/Om4PIqoQtYLljixsW7vPUw91SH
 raLVYdrrO0qFVhfFyq5uvV2f9YPBQRHhTdLOvlWlvtnT4E3Ej12IauAAiaWRXL5Qfbz7svFmEQ6N0
 CDil6u/IzxI7eu1Mphf4RMaNkgkJvPueZfKGb7MKvLqogM3VyBU06aMrIz1pN0J4FlaF9s/5WC2tX
 YnJPPB0KGV/zI4JP58cCREtgmIl0zLOfC2tRwTI5iOsIWwS2NI5TTz1Sb++mIl+K+7WHX9xfQITBS
 qMzLJ6x7mmiCS+0uoeZGANgekmHSfm7armbUW+BzUBk7EOGakbekmlAhEpw2/z/OGbeQ6PCuSfFDn
 NWgJxwSUcWMF+gU/rBpQlYyLFe1q+13+tyOw4WqMk=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "Meng, Bin" <Bin.Meng@windriver.com>,
 "Shi, Guohuai" <Guohuai.Shi@windriver.com>
Subject: Re: [PATCH v5 04/16] hw/9pfs: Implement Windows specific xxxdir() APIs
Date: Fri, 17 Mar 2023 13:16:41 +0100
Message-ID: <64580513.Tn2YgNgxKX@silver>
In-Reply-To: <MN2PR11MB4173971C16C358073A949C28EFBD9@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20230220100815.1624266-1-bin.meng@windriver.com>
 <MN2PR11MB4173F6A077C963E1C5149CF8EFBC9@MN2PR11MB4173.namprd11.prod.outlook.com>
 <MN2PR11MB4173971C16C358073A949C28EFBD9@MN2PR11MB4173.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Friday, March 17, 2023 5:36:37 AM CET Shi, Guohuai wrote:
[...]
> > > > > > +    do {
> > > > > > +        full_dir_entry = get_full_path_win32(hDir,
> > > > > > + dd_data.name);
> > > > > > +
> > > > > > +        if (full_dir_entry == NULL) {
> > > > > > +            err = ENOMEM;
> > > > > > +            break;
> > > > > > +        }
> > > > > > +
> > > > > > +        /*
> > > > > > +         * Open every entry and get the file informations.
> > > > > > +         *
> > > > > > +         * Skip symbolic links during reading directory.
> > > > > > +         */
> > > > > > +        hDirEntry = CreateFile(full_dir_entry,
> > > > > > +                               GENERIC_READ,
> > > > > > +                               FILE_SHARE_READ | FILE_SHARE_WRITE
> > > > > > +                               | FILE_SHARE_DELETE,
> > > > > > +                               NULL,
> > > > > > +                               OPEN_EXISTING,
> > > > > > +                               FILE_FLAG_BACKUP_SEMANTICS
> > > > > > +                               | FILE_FLAG_OPEN_REPARSE_POINT,
> > > > > > + NULL);
> > > > > > +
> > > > > > +        if (hDirEntry != INVALID_HANDLE_VALUE) {
> > > > > > +            if (GetFileInformationByHandle(hDirEntry,
> > > > > > +                                           &FileInfo) == TRUE) {
> > > > > > +                attribute = FileInfo.dwFileAttributes;
> > > > > > +
> > > > > > +                /* only save validate entries */
> > > > > > +                if ((attribute & FILE_ATTRIBUTE_REPARSE_POINT) == 0) {
> > > > > > +                    if (index >= list_count) {
> > > > > > +                        list_count = list_count + 16;
> > > > >
> > > > > Magic number 16 again.
> > > > >
> > > > > > +                        file_id_list = g_realloc(file_id_list,
> > > > > > +                                                 sizeof(uint64_t)
> > > > > > +                                                 * list_count);
> > > > >
> > > > > OK, so here we are finally at the point where you chose the
> > > > > overall behaviour for this that we discussed before.
> > > > >
> > > > > So you are constantly appending 16 entry chunks to the end of the
> > > > > array, periodically reallocate the entire array, and potentially
> > > > > end up with one giant dense array with *all* file IDs of the directory.
> > > > >
> > > > > That's not really what I had in mind, as it still has the
> > > > > potential to easily crash QEMU if there are large directories on host.
> > > > > Theoretically a Windows directory might then consume up to 16 GB
> > > > > of RAM for looking up only one single directory.
> > > > >
> > > > > So is this the implementation that you said was very slow, or did
> > > > > you test a different one? Remember, my orgiginal idea (as starting
> > > > > point for Windows) was to only cache *one* file ID (the last being
> > > > > looked up). That's it. Not a list of file IDs.
> > > >
> > > > If only cache one file ID, that means for every read directory operation.
> > > > we need to look up whole directory to find out the next ID larger
> > > > than last
> > > cached one.
> > > >
> > > > I provided some performance test in last patch:
> > > > Run test for read directory with 100, 1000, 10000 entries #1, For
> > > > file name cache solution, the time cost is: 2, 9, 44 (in ms).
> > > > #2, For file id cache solution, the time cost: 3, 438, 4338 (in ms).
> > > > This
> > > is current solution.
> > > > #3, for cache one id solution, I just tested it: 4, 4788, more than
> > > > one minutes (in ms)
> > > >
> > > > I think it is not a good idea to cache one file id, it would be very
> > > > bad performance
> > >
> > > Yes, the performce would be lousy, but at least we would have a basis
> > > that just works^TM. Correct behaviour always comes before performance.
> > > And from there you could add additional patches on top to address
> > > performance improvements. Because the point is: your implementation is
> > > also suboptimal, and more importantly: prone to crashes like we discussed
> > before.
> > >
> > > Regarding performance: for instance you are re-allocating an entire
> > > dense buffer on every 16 new entries. That will slow down things
> > > extremely. Please use a container from glib, because these are
> > > handling resize operations more smoothly for you out of the box, i.e.
> > > typically by doubling the container capacity instead of re-allocating
> > frequently with small chunks like you did.
> > >
> > > However I am still not convinced that allocating a huge dense buffer
> > > with
> > > *all* file IDs of a directory makes sense.
> > >
> > > On the long-term it would make sense to do it like other implementations:
> > > store a snapshot of the directory temporarily on disk. That way it
> > > would not matter how huge the directory is. But that's a complex
> > > implementation, so not something that I would do in this series already.
> > >
> > > On the short/mid term I think we could simply make a mix of your
> > > solution and the one-ID solution that I suggested: keeping a maximum
> > > of e.g. 1k file IDs in RAM. And once guest seeks past that boundary,
> > > loading the subsequent 1k entries, free-ing the previous 1k entries, and so
> > on.
> > >
> > 
> > Please note that the performance data is tested in native OS, but not in
> > QEMU.
> > It is even worse in QEMU.
> > 
> > I run Linux guest OS on Windows host, use "ls -l" command to list a directory
> > with about 100 entries.
> > "ls -l" command need about 0.5 second to display one directory entry.
> > 
> > Caching only one node (file id, or file name, or others) will make 9pfs not
> > usable: listing 100 directory entries need 50 seconds in guest OS.

I think we have a misapprehension here, to make this more clear: I had no
intention to roll that one-entry-cache solution out to customers. The idea
rather was this to be the base patch, followed by whatever optimization
patch(es) on top of that. So this one-cache solution would basically just
end up being burried in git history, not being used by a regular user at all.

Reasons for this preliminary DOA patch:

1. An optimized solution with n file IDs (that would then in fact being rolled
out as official QEMU release to users) is a logical extension of a simple
implementation with only 1 file ID, and it always makes sense to split patches
at logical points.

2. If some problem arises, we can always tell people to rollback to this
simple implementation and check if the problem exists there as well (no matter
how long it takes to run the test).

3. If really necessary, we could even make this 1 file ID solution a runtime
option in a distant future, which would be overkill at this point though.

> I have to point out that you missing about random accessing for a directory, this is the key of performance.
> In QEMU 9p directory reading solution, it will try to read as many as possible entries (in function do_readdir_many).
> When the butter is not enough, do_readdir_many will re-seek to the last read entry.
> The key point is the "re-seek" directory.
> 
> Read directory is always read the next entry, so cache one id will be OK, and less performance impact.
> But seek directory may seek to anywhere, seek directory need to cache all IDs.

No, random access is not permitted anywhere! We have two aspects on this:

1. On guest user space level there is seekdir() and telldir(). But it's not
like that user could seek randomly like telldir() + n. In fact, many file
systems don't support this kind of operation, as often some kind of internal
file system dependent value is passed for performance reasons as "offset",
e.g. something like:

Filename  Offset
001.dat   240
002.dat   80
003.dat   586
...

Instead, POSIX defines that the argument passed to seekdir() *must* have been
obtained by a telldir() call before, exactly for the reason described above.

2. On 9p2000.L protocol level (the default 9p protocol version used by Linux
clients): here we have `Treaddir` only. Which is not a random access request,
instead it is designed to just split large directories into several, smaller
requests and passing the offset of the *previous* `Treaddir` response as
argument to the next `Treaddir` request:

https://github.com/chaos/diod/blob/master/protocol.md#readdir---read-a-directory

3. On 9p2000.u protocol level (a 9p protocol version that we already
discourage to use and are probably going to deprecate) there is no such thing
as `Treaddir`, instead `Tread` on a directory FID is used, however also in
this case the protocol specs are clear that random access is not allowed,
quote:

"For directories, read returns an integral number of direc- tory entries
exactly as in stat (see stat(5)), one for each member of the directory. The
read request message must have offset equal to zero or the value of offset in
the previous read on the directory, plus the number of bytes returned in the
previous read. In other words, seeking other than to the beginning is illegal
in a directory (see seek(2))."

http://ericvh.github.io/9p-rfc/rfc9p2000.html#anchor30

> Consider about this case:
> There are 100 files in directory, name is from "file001" to "file100".
> 
> Currently, next read entry is "file050".
> Now, user want to seek to directory offset 20 (should be "file020").
> Because we only cached one id ("file050"), we do not know the file id for offset 20.
> So we could only get the file id in offset 0 (need to search whole directory to get the minimal ID), and get the file id in offset 1, ... to offset 20.
> 
> So for the random accessing, seek to offset N in a directory with M-entries, we need to search whole directory for N times and reading totally M*N entries.

Whenever you are capturing other file IDs - no matter if only 1 different or
multiple different file IDs - you would need to *always* scan the entire
directory. Otherwise you would always risk incorrect behaviour.

That's why I suggested as subsequent patch on top of the 1-file-id patch, a
subsequent 2nd patch as optimization that would cache max. e.g. 1000 entries
directory entries in RAM, to avoid scanning the entire directory too often.

> If there are 1000 files in a directory, and want seek to offset 1000 randomly, need to open file 1000*1000 times.
> For the worst test case: read + seek + read for 1000 files, 9p on Windows host will need open files for 1000*(1 + 2 + 3 ... 1000) = 500500000 times. It may need several hours to finish it.
> 
> Another problem is: if only cache one ID, we can not detect which directory is deleted.

We don't care detecting whether or not entries were deleted.

> It is no difference with use MinGW native APIs, and we go back to the start point.

Yes it is! The essential difference is: with the MinGW API, when some entry is
deleted in between, then offsets are shifted such that guest might not receive
directory entries that *still* exist!

With the ordered file ID solution discussed here (no matter how many are
cached), as we would always return the directory entries sorted by file IDs to
guest, we can in contrast ensure that really all entries that *still* exist
are always returned to guest. And that's what we care about.

Another thing that I noticed when looking at your patch: you are first
obtaining only the file IDs of the individual directory entries and only
caching the file IDs. Which I understand, as you were really caching the 
entire directory in RAM.

It's absolutely OK to cache other directory entry info as well. And if we are
limiting caching to e.g. max. 1k entries or so, then we don't have a problem
with cached size either.

> Cache one ID is useful for getting next entry, but not useful for telling us where is current offset.
> Because after deleting some entries, guest OS may re-seek to the last offset. Storing only one ID is useless for re-seek to last offset.
> 
> Here is summarize of requirements:
> 1. Guest OS may seek directory randomly.
> 2. Some entries may be deleted during directory reading.
> 
> To match the requirements, a snapshot of directory may be the only solution.
> So we should force on which information should be in snapshot (file id, or filename), and how to store it.
> I do not think it is a big problem for large directory. Actually, if there are more than 1 million files in a directory, Windows File Explorer may not response.

:) That's the solution that I suggested as long-term solution several times
before, as I also pointed out that other file servers are using this solution
as well. And yes, that is "probably" the "best" solution. But I think you are
underestimating the complexity of this solution.

Of course you can easily capture all directory entries in one rush, serialize
them as raw struct to a temporary file, and deserialize those structs when
being accessed. That's not the thing. But there is a lot more on this: e.g.
where would you store these temporary files? How long would you store them
there and what would be the precise mechanism to drop them? Whatabout cleanup
mechanisms after an unclean QEMU shutdown? And would it really be faster than
say caching 1000 entries in RAM? Do we share directory snapshots, and if yes how?




